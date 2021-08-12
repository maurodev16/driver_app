import 'package:driver_app/Routers/appRouters.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'basicInfoController.dart';

Widget basicInfoNextBackBtn() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: Text('Back'),
        ),
        GetBuilder<BasicInfoController>(
          builder: (controller) {
            return ElevatedButton(
              child: Text('Next'),
              onPressed: controller.formValid
                  ? () {
                      Get.toNamed(AppRoutes.ADDRESSPAGE);
                    }
                  : null,
            );
          },
        ),
      ],
    ),
  );
}
