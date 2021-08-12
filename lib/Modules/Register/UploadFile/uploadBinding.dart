import 'package:get/get.dart';

import 'uploadFileController.dart';

class UploadFileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UploadFileController());
  }
}
