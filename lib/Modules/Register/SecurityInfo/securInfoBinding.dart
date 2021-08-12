import 'package:get/get.dart';

import 'securInfoController.dart';

class SecurInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SecurInfoController());
  }
}
