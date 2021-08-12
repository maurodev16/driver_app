import 'package:get/get.dart';

import 'resumeController.dart';

class ResumeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ResumeController());
  }
}
