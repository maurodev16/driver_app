import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:rider_app/Controllers/googleMapsController.dart';

Widget containerRequestingRider() {
  return GetBuilder<GoogleMapsController>(builder: (ctr) {
    return ctr.hideContainerRequestingRider.value == false
        ? Container()
        : Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 0.5,
                    blurRadius: 16,
                    color: Colors.white,
                    offset: Offset(0.7, 0.7),
                  ),
                ],
              ),
              height: 180,
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 100.0, height: 100.0),
                        RotateAnimatedTextKit(
                          duration: Duration(seconds: 2),
                          isRepeatingAnimation: true,
                          repeatForever: true,
                          textAlign: TextAlign.center,
                          onTap: () {
                            print("Tap Event");
                          },
                          text: [
                            'Requesting..'.tr,
                            'Please, wait..'.tr,
                          ],
                          textStyle: TextStyle(
                            fontSize: 20,
                            fontFamily: "BalooTammaBold",
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    width: Get.width,
                    child: Hero(
                      tag: 10,
                      child: GFButton(
                        onPressed: () async {
                          Get.defaultDialog(
                            content: Hero(
                              tag: 10,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: NetworkGiffyDialog(
                                  image: Image.asset(
                                    'assets/gifs/loading.gif',
                                  ),
                                  title: Text(
                                    'Cancel my request'.tr,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  entryAnimation: EntryAnimation.TOP,
                                  buttonCancelText: Text('No'.tr),
                                  buttonOkText: Text('Yes'.tr),
                                  onOkButtonPressed: () {
                                    ctr.cancelRideRequest();
                                    ctr.resetMapPage();
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                        color: Colors.black,
                        text: "Cancel request".tr,
                        icon: Icon(Icons.cancel_outlined),
                        shape: GFButtonShape.pills,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  });
}
