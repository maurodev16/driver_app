import 'package:get/get.dart';

class SecurInfoController extends GetxController {
  var _obscureText = true.obs;
  get getObscureText => _obscureText.value;
  set setObscureText(value) => _obscureText.value = value;
}
