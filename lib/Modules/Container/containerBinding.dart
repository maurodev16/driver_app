import 'package:get/get.dart';

import 'containerController.dart';

class ContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ContainerController());
  }
}
