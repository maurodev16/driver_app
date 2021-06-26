import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rider_app/Controllers/googleMapsController.dart';
import 'package:rider_app/Services/Helper/constColors.dart';

class LoadingPage extends StatelessWidget {
  final GoogleMapsController _googleMapsController =
      Get.put(GoogleMapsController());
  @override
  Widget build(BuildContext context) {
    var height = 150.0;
    return Container(
      height: Get.height,
      width: Get.width,
      child: Container(
        height: height,
        width: height,
        alignment: Alignment.center,
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: mWhite,
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    GetPlatform.isIOS
                        ? CupertinoActivityIndicator(
                            radius: 20,
                          )
                        : CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                    Image.asset(
                      "assets/gifs/loading.gif",
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              Obx(
                () =>
                    _googleMapsController.locationServicesActive.value == false
                        ? Text(
                            'Location must be activated, please check.'.tr,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10.0,
                            ),
                          )
                        : Text(
                            'Please, wait..'.tr,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10.0,
                            ),
                          ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
