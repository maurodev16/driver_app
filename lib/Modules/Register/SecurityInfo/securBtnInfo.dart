import 'package:driver_app/Routers/appRouters.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget securBtnInfo() {
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
        ElevatedButton(
          onPressed: () {
            Get.toNamed(AppRoutes.AVATARPAGE);
          },
          child: Text('Next'),
        ),
      ],
    ),
  );
}
