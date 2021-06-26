import 'package:get/get.dart';
import 'package:rider_app/Controllers/authController.dart';
import 'package:rider_app/Controllers/googleMapsController.dart';
import 'package:rider_app/Pages/LanguagePage/languageController.dart';

class MyBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LanguageController());
    Get.put<GoogleMapsController>(GoogleMapsController());
    Get.lazyPut<AuthController>(() => AuthController());
  }
}
