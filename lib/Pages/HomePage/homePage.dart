import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rider_app/Controllers/googleMapsController.dart';
import 'package:rider_app/GlobalWidgets/globalWidgets.dart';
import 'package:rider_app/Pages/SplashPage/loadingPage.dart';

import 'Widgets/containerButtomSearch.dart';
import 'Widgets/containerRequestingRider.dart';
import 'containerPriceDetail.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    final controller = Get.find<GoogleMapsController>();
    return GetBuilder<GoogleMapsController>(
      builder: (ctr) {
        return Scaffold(
          key: _scaffoldKey,
          drawer: drawerWidget(context),
          body: SafeArea(
            child: controller.currentPosition != null
                ? Stack(
                    children: [
                      ///GOOGLE MAPS
                      GoogleMap(
                        initialCameraPosition: ctr.cameraPosition,
                        onMapCreated: (GoogleMapController controller) {
                          ctr.controllerGoogleMap.complete(controller);
                          ctr.setNewGoogleMapController = controller;
                          ctr.locatePosition();
                          ctr.createIconMarkerLKW(context);
                        },
                        myLocationEnabled: true,
                        myLocationButtonEnabled: true,
                        zoomGesturesEnabled: true,
                        zoomControlsEnabled: true,
                        mapType: MapType.normal,
                        compassEnabled: true,
                        markers: ctr.markersSet,
                        polylines: ctr.polylinesSet,
                        circles: ctr.circlesSet,
                      ),

                      /// MENU HAMBURGER
                      Positioned(
                        top: 45.0,
                        left: 22.0,
                        child: GestureDetector(
                          onTap: () {
                            _scaffoldKey.currentState.openDrawer();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(22.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 6.0,
                                  spreadRadius: 0.5,
                                  offset: Offset(0.7, 0.7),
                                )
                              ],
                            ),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.menu_outlined,
                                color: Colors.black,
                              ),
                              radius: 20.0,
                            ),
                          ),
                        ),
                      ),

                      /// WIDGET CONTAINER PRICE
                      containerPriceDetail(),

                      ///WIDGET BOTTON SEARCH
                      containerButtomSearch(),

                      // ///WIDGET SEND REQUEST ANIMATION
                      containerRequestingRider(),
                    ],
                  )
                : LoadingPage(),
          ),
        );
      },
    );
  }
}
