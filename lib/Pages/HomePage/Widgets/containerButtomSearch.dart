import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:rider_app/Controllers/googleMapsController.dart';

Widget containerButtomSearch() {
  return GetBuilder<GoogleMapsController>(builder: (ctr) {
    return ctr.hasInfo.value == false
        ? Positioned(
            bottom: 50,
            left: 50,
            right: 50,
            child: Hero(
              tag: 10,
              child: Expanded(
                child: Container(
                  height: 50,
                  width: Get.width * 0.5,
                  child: GFButton(
                    onPressed: () async {
                      var res = await Get.toNamed('/searchPage');
                      if (res == "obtainDirection") {
                        ctr.showHideFloatingButton(
                            ctr.txtDropoffController.text);
                      }
                    },
                    text: 'Search'.tr,
                    icon: Icon(Icons.pin_drop),
                    shape: GFButtonShape.pills,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          )
        : Container();
  });
}
