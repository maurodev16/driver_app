import 'dart:math';

import 'package:rider_app/Models/NearByDriverModel/nearbyAvaliableDriverModel.dart';

class GeoFireAssistant {
  ////NAO ESQUECER DE MOVER TODOS ESSES CODIGOS PARA UM GETCONTROLLER
  static List<NearbyDriversModel> nearbyAvailableDriversList = [];
  static void removeDriverFronList(String key) {
    int index =
        nearbyAvailableDriversList.indexWhere((element) => element.key == key);
    nearbyAvailableDriversList.remove(index);
  }

  static void updateDriverNearbyLocation(
      NearbyDriversModel nearbyDriversModel) {
    int index = nearbyAvailableDriversList
        .indexWhere((element) => element.key == nearbyDriversModel.key);
    //Update Latitude e Longituda
    nearbyAvailableDriversList[index].latitude = nearbyDriversModel.latitude;
    nearbyAvailableDriversList[index].longitude = nearbyDriversModel.longitude;
  }

  static double createRandownNumber(int number) {
    var randow = Random();
    int radNumber = randow.nextInt(number);
    return radNumber.toDouble();
  }
}
