import 'package:get/get.dart';

import 'basicInfoController.dart';

class BasicInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BasicInfoController());
  }
}
