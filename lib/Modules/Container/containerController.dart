import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContainerController extends GetxController {
  late PageController pageController;

  var _indexSelected = 0.obs;
  get getIndexSelected => _indexSelected.value;
  set setIndexSelected(value) {
    _indexSelected.value = value;
    update();
  }

  @override
  void onInit() {
    //  tabController = TabController(length: 3, vsync: this);
    pageController = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
