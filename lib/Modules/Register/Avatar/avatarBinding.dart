import 'package:get/get.dart';

import 'avatarController.dart';

class AvatarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AvatarController());
  }
}
