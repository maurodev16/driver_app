import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_geofire/flutter_geofire.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rider_app/Controllers/authController.dart';
import 'package:rider_app/HttpRequest/HttpRequest.dart';
import 'package:rider_app/Models/AddressModel/addressModel.dart';
import 'package:rider_app/Models/DirectionDetailModel/directionDetailModel.dart';
import 'package:rider_app/Models/NearByDriverModel/nearbyAvaliableDriverModel.dart';
import 'package:rider_app/Models/PlacePrediction/placePrediction.dart';
import 'package:rider_app/Pages/AuthPages/GlobalWidget/progressDialog.dart';
import 'package:rider_app/Services/Api/googleMapsKeys.dart';
import 'package:rider_app/Services/Helper/geoFireAssistent.dart';
import 'package:rider_app/Services/Helper/utility.dart';
import 'package:uuid/uuid.dart';

class GoogleMapsController extends GetxController {
  TextEditingController txtPickUpController = TextEditingController();
  TextEditingController txtDropoffController = TextEditingController();
  var _placeAddress = "".obs;

  ///
  get getPlaceAddress => _placeAddress.value;
  set setPlaceAddress(value) => _placeAddress.value = value;

  ///
  @override
  void onInit() async {
    super.onInit();
    uuid = Uuid();
    await locatePosition();
  }

  ///
  AddressModel pickupLocation;
  AddressModel dropOffLocation;

  ///
  DirectionDetailModel tripDirectionDetailModel;

  ///
  RxList<PlacePredictionModel> getplaceList = RxList();

  CameraPosition cameraPosition;

  ///
  List<Location> locations;

  ///
  var locationServicesActive = true.obs;
  Completer<GoogleMapController> controllerGoogleMap = Completer();

  ///
  GoogleMapController _newGoogleMapController;
  get getNewGoogleMapController => _newGoogleMapController;
  set setNewGoogleMapController(value) {
    _newGoogleMapController = value;
    update();
  }

  ///
  Position currentPosition;

  ///
  var nearByavailableDriverKeysLoad = false.obs;
  //USER LOCATION
  Future locatePosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;
    latLngPosition = LatLng(position.latitude, position.longitude);

    cameraPosition = CameraPosition(target: latLngPosition, zoom: 14);
    await searchCordenationAddress(position);
    initGeoFireListner();
    update();
  }

  var geoLocator = Geolocator();
  var hasInfo = false.obs;
  var hideContainerRequestingRider = false.obs;

  ///
  Uuid uuid;
  Set<Marker> _markers = {};
  Set<Polyline> _polylines = {};
  Set<Circle> _circles = {};

  ///
  Set<Polyline> get polylinesSet => _polylines;
  Set<Marker> get markersSet => _markers;
  set setMarkerSet(valeu) => _markers;
  Set<Circle> get circlesSet => _circles;

  ///
  BitmapDescriptor nearbyIcon;

  ///
  LatLng latLngPosition;
  updatePickupLoacationAddress(AddressModel pickupAddress) {
    pickupLocation = pickupAddress;
    update();
  }

  updateDropOffLoacationAddress(AddressModel dropOffAddress) {
    dropOffLocation = dropOffAddress;
    update();
  }

  findPlace(String placename) async {
    if (placename.length > 1) {
      String autoCompleteUrl =
          "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$placename&key=$apiKey&sessiontoken=1234567890&components=country:de";
      var res = await HttpRequest.getRequest(autoCompleteUrl);
      if (res == "failed") {
        return;
      }
      if (res["status"] == "OK") {
        var predictions = res["predictions"];
        var placeList = (predictions as List)
            .map((e) => PlacePredictionModel.fromJson(e))
            .toList();

        getplaceList.assignAll(placeList);
      }
    }
    update();
  }

  void getPlaceAddressDetails(String placeId) async {
    Get.dialog(
      Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
            child: ProgressDialog(
                message: 'Defining destination, please wait ..'.tr),
          ),
        ],
      ),
    );
    String url =
        "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$apiKey";
    var res = await HttpRequest.getRequest(url);
    Get.back();
    if (res == "failed") {
      return;
    }
    if (res["status"] == "OK") {
      AddressModel addressModel = AddressModel();
      addressModel.placeName = res["result"]["name"];
      addressModel.placeId = placeId;
      addressModel.latitude = res["result"]["geometry"]["location"]["lat"];
      addressModel.longitude = res["result"]["geometry"]["location"]["lng"];
      // dropoffTextController.text = addressModel.placeName;
      txtDropoffController.text = addressModel.placeName;
      await updateDropOffLoacationAddress(addressModel);

      print("DROP OFF ========${addressModel.placeName}");
      Get.back(result: "obtainDirection");
      update();
    }
  }

  Future<String> searchCordenationAddress(Position position) async {
    String city, postCode, strName, state;
    String url =
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$apiKey";
    var response = await HttpRequest?.getRequest(url);
    print("SUA SITUACAO COM O GOOGLE MAPS SE ENCONTRA:::$response");
    if (response != "failed") {
      city = response["results"][0]["address_components"][3]["long_name"];
      postCode = response["results"][0]["address_components"][7]["long_name"];
      strName = response["results"][0]["address_components"][1]["long_name"];
      state = response["results"][0]["address_components"][5]["long_name"];

      _placeAddress.value = "$city, $postCode, $strName, $state";
      //pickUpTextController.text = placeAddress.value;
      txtPickUpController.text = _placeAddress.value;
      AddressModel userPickupAddressModel = new AddressModel();

      userPickupAddressModel.longitude = position.longitude;
      userPickupAddressModel.latitude = position.latitude;
      userPickupAddressModel.placeName = _placeAddress.value;

      await updatePickupLoacationAddress(userPickupAddressModel);
    }
    print("#####MEU ENDERECO E : ${_placeAddress.value}");
    txtPickUpController.text = _placeAddress.value;
    update();
    return _placeAddress.value;
  }

  static Future<DirectionDetailModel> obtainPlaceDirectionDetails(
      LatLng initialPosition, LatLng finalPosition) async {
    //String direction = "";

    String url =
        "https://maps.googleapis.com/maps/api/directions/json?origin=${initialPosition.latitude}, ${initialPosition.longitude}&destination=${finalPosition.latitude}, ${finalPosition.longitude}&key=$apiKey";
    var response = await HttpRequest.getRequest(url);
    if (response == "failed") {
      return null;
    }

    DirectionDetailModel directionDetailModel = DirectionDetailModel();

    ///
    directionDetailModel.encodedPoints =
        response["routes"][0]["overview_polyline"]["points"];

    ///
    directionDetailModel.distanceText =
        response["routes"][0]["legs"][0]["distance"]["text"];
    directionDetailModel.distanceValue =
        response["routes"][0]["legs"][0]["distance"]["value"];

    ///
    directionDetailModel.durationText =
        response["routes"][0]["legs"][0]["duration"]["text"];
    directionDetailModel.durationValue =
        response["routes"][0]["legs"][0]["duration"]["value"];

    return directionDetailModel;
  }

  ///! SEND REQUEST (USED _inputDestination)
  Future<void> sendRequest(String destintionName) async {
    _markers.clear();
    circlesSet.clear();
    locations = await locationFromAddress(destintionName);

    // double latitude = locations[0].latitude;
    // double longitude = locations[0].longitude;
    // LatLng destination = LatLng(latitude, longitude);
    var initialPos = pickupLocation;
    var finalPos = dropOffLocation;

    var pickUpLatLng = LatLng(initialPos.latitude, initialPos.longitude);
    var dropOffLatLng = LatLng(finalPos.latitude, finalPos.longitude);

    Get.dialog(
        ProgressDialog(message: 'Setting destination, please wait..'.tr));

    dropOffLocationMarker(dropOffLatLng, destintionName);

    var router = await obtainPlaceDirectionDetails(pickUpLatLng, dropOffLatLng);
    tripDirectionDetailModel = router;

    Get.back();

    createRouter(router.encodedPoints);

    print("ROUTTTERRRR+++++++++++${router.encodedPoints}");
    LatLngBounds latLngBounds;
    if (pickUpLatLng.latitude > dropOffLatLng.latitude &&
        pickUpLatLng.longitude > dropOffLatLng.longitude) {
      latLngBounds =
          LatLngBounds(southwest: dropOffLatLng, northeast: pickUpLatLng);
    } else if (pickUpLatLng.longitude > dropOffLatLng.longitude) {
      latLngBounds = LatLngBounds(
        southwest: LatLng(pickUpLatLng.latitude, dropOffLatLng.longitude),
        northeast: LatLng(dropOffLatLng.latitude, pickUpLatLng.longitude),
      );
    } else if (pickUpLatLng.latitude > dropOffLatLng.latitude) {
      latLngBounds = LatLngBounds(
        southwest: LatLng(dropOffLatLng.latitude, pickUpLatLng.longitude),
        northeast: LatLng(pickUpLatLng.latitude, dropOffLatLng.longitude),
      );
    } else {
      latLngBounds =
          LatLngBounds(southwest: pickUpLatLng, northeast: dropOffLatLng);
    }
    _newGoogleMapController
        .animateCamera(CameraUpdate.newLatLngBounds(latLngBounds, 70));

    Marker pickupLocMarker = Marker(
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
        infoWindow:
            InfoWindow(title: initialPos.placeName, snippet: 'My Location'.tr),
        position: pickUpLatLng,
        markerId: MarkerId(uuid.v4()));

    Circle pickUpLocCircle = Circle(
      circleId: CircleId(uuid.v4()),
      fillColor: Colors.lightGreen,
      center: pickUpLatLng,
      radius: 12,
      strokeWidth: 4,
      strokeColor: Colors.yellow,
    );

    Circle dropOffLocCircle = Circle(
      circleId: CircleId(uuid.v4()),
      fillColor: Colors.red,
      center: dropOffLatLng,
      radius: 12,
      strokeWidth: 4,
      strokeColor: Colors.black,
    );

    _markers.add(pickupLocMarker);
    circlesSet.add(pickUpLocCircle);
    circlesSet.add(dropOffLocCircle);
    update();
  }

  ///! ADD MARKERS DESTINATION
  void dropOffLocationMarker(LatLng location, String destinationAddressName) {
    _markers.add(
      Marker(
        markerId: MarkerId(uuid.v4()),
        position: location,
        infoWindow: InfoWindow(
          title: destinationAddressName,
          snippet: 'Destination'.tr,
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
      ),
    );
    update();
  }

  createRouter(encodedPoly) {
    _polylines.clear();
    _polylines.add(
      Polyline(
        polylineId: PolylineId(uuid.v4()),
        jointType: JointType.round,
        startCap: Cap.roundCap,
        endCap: Cap.roundCap,
        geodesic: true,
        width: 5,
        color: Colors.pink,
        points: convertToLatLng(decodePoly(encodedPoly)),
        onTap: () {
          print("ICH BIN AINE PILYLINE");
        },
      ),
    );

    update();
  }

  void showHideFloatingButton(String destination) async {
    await sendRequest(destination);
    hasInfo.value = true;
    update();
  }

  void cancelRideRequest() {
    userRideInfoRef.remove();
  }

  void displayRequestRideContaner() {
    hideContainerRequestingRider.value = true;
    hasInfo.value = false;
    Get.find<AuthController>().saveRideRequestOnFirebase();
    update();
  }

  /// ! CREATE LONG AND LAT LIST
  List<LatLng> convertToLatLng(List points) {
    List<LatLng> result = <LatLng>[];
    for (int i = 0; i < points.length; i++) {
      if (i % 2 != 0) {
        result.add(LatLng(points[i - 1], points[i]));
      }
    }

    update();
    return result;
  }

  List decodePoly(String poly) {
    var list = poly.codeUnits;
    var lList = [];
    int index = 0;
    int len = poly.length;
    int c = 0;

    ///Repeating until all attributes are decoded
    do {
      var shift = 0;
      int result = 0;

      /// for decoding value of attribute
      do {
        c = list[index] - 63;
        result |= (c & 0x1F) << (shift * 5);
        index++;
        shift++;
      } while (c >= 32);
      /*if value is negative bitwise not the value*/
      if (result & 1 == 1) {
        result = ~result;
      }
      var result1 = (result >> 1) * 0.00001;
      lList.add(result1);
    } while (index < len);
    /*adding to previous value as done in encoding */
    for (var i = 2; i < lList.length; i++) lList[i] += lList[i - 2];
    print("Esta e minha lista de POLY: ${lList.toString()}");
    update();

    return lList;
  }

  ///
  int calculateFares(DirectionDetailModel directionDetailModel) {
    //for dolars
    double timeTravelFare = (directionDetailModel.durationValue / 60) *
        0.70; //divididdo por 60 = 1 minuto
    double distanceTravelFare =
        (directionDetailModel.distanceValue / 1000) * 0.70; //por quilometros
    double totalFareAmount = timeTravelFare + distanceTravelFare;

    return totalFareAmount.truncate();
  }

  void resetMapPage() {
    polylinesSet.clear();

    _markers.clear();
    _circles.clear();
    hideContainerRequestingRider.value = false;
    hasInfo.value = false;
    Get.back();
    update();
  }

  void initGeoFireListner() {
    //comment
    Geofire.initialize("availableDrivers");
    Geofire.queryAtLocation(
            currentPosition.latitude, currentPosition.longitude, 15)
        .listen((map) {
      print(map);
      if (map != null) {
        var callBack = map['callBack'];

        //latitude will be retrieved from map['latitude']
        //longitude will be retrieved from map['longitude']

        switch (callBack) {
          case Geofire.onKeyEntered:
            NearbyDriversModel nearbyDriversModel = NearbyDriversModel();
            nearbyDriversModel.key = map['key'];
            nearbyDriversModel.latitude = map['latitude'];
            nearbyDriversModel.longitude = map['longitude'];
            GeoFireAssistant.nearbyAvailableDriversList.add(nearbyDriversModel);
            if (nearByavailableDriverKeysLoad.value == true) {
              updateAvailableDriversOnMap();
            }
            break;

          case Geofire.onKeyExited:
            //Remove a chave do banco de dados quando o Motorista ficar offline
            GeoFireAssistant.removeDriverFronList(map['key']);

            ///SEMPRE QUE O CARRO ANDAR E ADICIONADO A MARQUINHA MOVENDO
            updateAvailableDriversOnMap();
            break;

          case Geofire.onKeyMoved:
            // Update your key's location
            NearbyDriversModel nearbyDriversModel = NearbyDriversModel();
            nearbyDriversModel.key = map['key'];
            nearbyDriversModel.latitude = map['latitude'];
            nearbyDriversModel.longitude = map['longitude'];
            GeoFireAssistant.updateDriverNearbyLocation(nearbyDriversModel);

            ///SEMPRE QUE O CARRO ANDAR E ADICIONADO A MARQUINHA MOVENDO
            updateAvailableDriversOnMap();
            break;

          case Geofire.onGeoQueryReady:
            // All Intial Data is loaded
            ///SEMPRE QUE O CARRO ANDAR E ADICIONADO A MARQUINHA MOVENDO
            updateAvailableDriversOnMap();
            print(map['result']);

            break;
        }
      }
    });
    //comment
    update();
  }

  void updateAvailableDriversOnMap() {
    _markers.clear();
    update();
    Set<Marker> tmarkers = Set<Marker>();

    ///Tras a Lista de Motoristas disponiveis
    for (NearbyDriversModel driversModel
        in GeoFireAssistant.nearbyAvailableDriversList) {
      ///Pega a Latitude e Longitude do Motorista
      LatLng driverAvaiablePosition =
          LatLng(driversModel.latitude, driversModel.longitude);
      //Adiciona as Marquinhas
      Marker marker = Marker(
        markerId: MarkerId("Driver ${driversModel.key}"),
        position: driverAvaiablePosition,
        icon: nearbyIcon,
        rotation: GeoFireAssistant.createRandownNumber(360),
      );

      tmarkers.add(marker);
    }
    update();
    _markers = tmarkers;
  }

  void createIconMarkerLKW(context) {
    if (nearbyIcon == null) {
      ImageConfiguration imageConfiguration =
          createLocalImageConfiguration(context, size: Size(3, 3));
      BitmapDescriptor.fromAssetImage(
              imageConfiguration, "assets/images/carIcon.png")
          .then((value) {
        nearbyIcon = value;
      });
    }
    update();
  }
}
