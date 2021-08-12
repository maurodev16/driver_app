import 'package:get/get.dart';

import 'addressController.dart';

class AddressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddressController());
  }
}
