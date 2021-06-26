import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:rider_app/Controllers/googleMapsController.dart';

Widget containerPriceDetail() {
  return GetBuilder<GoogleMapsController>(builder: (ctr) {
    return ctr.hasInfo.value == true
        ? Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.red,
                    blurRadius: 16,
                    spreadRadius: 0,
                    offset: Offset(0.7, 0.7),
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 17),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      color: Colors.tealAccent[100],
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            Image.asset("assets/images/auto.png",
                                height: 50, width: 50),
                            SizedBox(width: 18),
                            Column(
                              children: [
                                Text(
                                  "Car".tr,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: "BalooTammaBold",
                                  ),
                                ),
                                Text(
                                  ((ctr.tripDirectionDetailModel != null)
                                      ? ctr
                                          .tripDirectionDetailModel.distanceText
                                      : ''),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "BalooTammaBold",
                                    color: Colors.grey,
                                  ),
                                )
                              ],
                            ),
                            Expanded(child: Container()),
                            Text(
                              ((ctr.tripDirectionDetailModel != null)
                                  ? '€${ctr.calculateFares(ctr.tripDirectionDetailModel)}'
                                  : ''),
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "BalooTammaBold",
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Icon(FontAwesomeIcons.moneyCheckAlt,
                              size: 18, color: Colors.black),
                          SizedBox(width: 16),
                          Text(
                            "Cash".tr,
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: "BalooTammaBold",
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 3),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.black54,
                            size: 16,
                          ),
                          Expanded(child: Container()),
                          InkWell(
                            onTap: () {
                              Get.defaultDialog(
                                content: Hero(
                                  tag: 10,
                                  child: NetworkGiffyDialog(
                                    image:
                                        Image.asset('assets/gifs/loading.gif'),
                                    title: Text(
                                      'Cancel my request'.tr,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    description: Text(
                                      'Are you sure you want to cancel this request?'
                                          .tr,
                                      textAlign: TextAlign.center,
                                    ),
                                    entryAnimation: EntryAnimation.TOP,
                                    buttonCancelText: Text("No".tr),
                                    buttonOkText: Text("Yes".tr),
                                    onOkButtonPressed: () {
                                      ctr.resetMapPage();
                                    },
                                  ),
                                ),
                              );
                            },
                            child: Text(
                              "Cancelar request".tr,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "BalooTammaBold",
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: ElevatedButton(
                        onPressed: () {
                          ctr.displayRequestRideContaner();
                        },
                        child: Padding(
                          padding: EdgeInsets.all(17),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Request".tr,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: "BalooTammaBold",
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(
                                FontAwesomeIcons.truck,
                                color: Colors.white,
                                size: 26,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : Container();
  });
}
