import 'package:driver_app/Routers/appRouters.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../WelcomeController.dart';

Widget get buttonSigninUI => Container(
      height: 60,
      width: 270,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Colors.white,
      ),
      child: Center(
        child: GestureDetector(
          onTap: () {
            Get.toNamed(AppRoutes.LOGINPAGE);
          },
          child: Text(
            'Sign in',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF8185E2),
            ),
          ),
        ),
      ),
    );

Widget get buttonSignupUI => Container(
      height: 60,
      width: 270,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Colors.amberAccent,
      ),
      child: Center(
        child: GestureDetector(
          onTap: () {
            Get.toNamed(AppRoutes.BASICINFOPAGE);
          },
          child: Text(
            'Sign up now',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey[600],
            ),
          ),
        ),
      ),
    );
void onTapDown(TapDownDetails details) {
  Get.find<WelcomeController>().controllerAnimation.forward();
}

void onTapUp(TapUpDetails details) {
  Get.find<WelcomeController>().controllerAnimation.reverse();
}
