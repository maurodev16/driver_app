import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:rider_app/Controllers/googleMapsController.dart';

import 'Widgets/predictionTile.dart';

class SearchPage extends GetWidget<GoogleMapsController> {
  //final GoogleMapsController _mapsController = Get.find();

  @override
  Widget build(BuildContext context) {
    controller.pickupLocation != null
        ? controller.txtPickUpController.text =
            controller.pickupLocation.placeName
        : controller.txtPickUpController.text = "";
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 215,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 6.0,
                    spreadRadius: 0.5,
                    offset: Offset(0.7, 0.7),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    left: 25.0, top: 20.0, right: 25.0, bottom: 20.0),
                child: Column(
                  children: [
                    SizedBox(height: 5.0),
                    Stack(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.arrow_back_outlined,
                            color: Colors.black,
                          ),
                        ),
                        Center(
                          child: Text(
                            'Transport-D',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "BalooTammaBold",
                              fontSize: 15.0,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.mapPin,
                          size: 20,
                          color: Colors.red,
                        ),
                        SizedBox(width: 18.0),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(3.0),
                              child: TextField(
                                controller: controller.txtPickUpController,
                                //onChanged: (value)=>controller.setTxtPickUpLocation = value,

                                decoration: InputDecoration(
                                  hintText: 'Pick up location'.tr,
                                  fillColor: Colors.grey[400],
                                  filled: true,
                                  border: InputBorder.none,
                                  isDense: true,
                                  contentPadding: EdgeInsets.only(
                                      left: 11, top: 8, bottom: 8),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        Hero(
                          tag: 10,
                          child: Icon(
                            Icons.pin_drop_sharp,
                            color: Colors.black,
                            size: 25,
                          ),
                        ),
                        SizedBox(width: 18.0),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(3.0),
                              child: TextField(
                                textInputAction: TextInputAction.go,
                                onChanged: (value) =>
                                    Get.find<GoogleMapsController>()
                                        .findPlace(value),
                                controller: Get.find<GoogleMapsController>()
                                    .txtDropoffController,
                                decoration: InputDecoration(
                                  hintText: 'Where?'.tr,
                                  fillColor: Colors.grey[400],
                                  filled: true,
                                  border: InputBorder.none,
                                  isDense: true,
                                  contentPadding: EdgeInsets.only(
                                      left: 11, top: 8, bottom: 8),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            GetBuilder<GoogleMapsController>(
              builder: (_mapsController) {
                return _mapsController.getplaceList.length > 0
                    ? Expanded(
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          child: ListView.separated(
                            shrinkWrap: true,
                            padding: EdgeInsets.all(0),
                            itemBuilder: (context, index) {
                              return PredictionTile(
                                placePredictionModel:
                                    _mapsController.getplaceList[index],
                              );
                            },
                            separatorBuilder: (context, index) => Divider(),
                            itemCount: _mapsController.getplaceList.length,
                            physics: ClampingScrollPhysics(),
                          ),
                        ),
                      )
                    : Container();
              },
            )
          ],
        ),
      ),
    );
  }
}
