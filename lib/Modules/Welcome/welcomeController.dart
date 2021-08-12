import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeController extends GetxController
    with SingleGetTickerProviderMixin {
  final int delaydAmount = 500;

  late AnimationController controllerAnimation;
  @override
  void onInit() {
    controllerAnimation = AnimationController(
      vsync: this,
      lowerBound: 0.0,
      upperBound: 0.1,
      duration: Duration(microseconds: 200),
    )..addListener(() {
        update();
      });
    super.onInit();
  }
}
