import 'package:get/get.dart';

import 'StatusController.dart';

class StatusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StatusController());
  }
}
