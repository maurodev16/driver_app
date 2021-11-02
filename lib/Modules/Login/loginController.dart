import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }


  final loginformKey = GlobalKey();
  var _obscureText = true.obs;
  var _email = ''.obs;
  var _password = ''.obs;
  var _rememberPass = ''.obs;

  get getObscureText => this._obscureText.value;
  set setObscureText(value) {
    this._obscureText.value = value;
    update();
  }

  get getRememberPass => this._rememberPass;
  set setRememberPass(value) {
    this._rememberPass.value = value;
    update();
  }

  get getEmail => this._email;
  set setEmail(value) {
    this._email.value = value;
    update();
  }

  get getPassword => this._password;
  set setPassword(value) {
    this._password.value = value;
    update();
  }

//VALIDA EMAIL
  bool? get emailValid => GetUtils.isEmail(_email.value.trim());
  String? get emailErr {
    if (GetUtils.isEmail(_email.value.trim())) {
      return null;
    } else {
      return _email.value = "Invalid Email";
    }
  }

  //VALIDA PASSWORD
  bool? get passwordValid => _password.value != "";
  String? get passwordErr {
    if (_password.value != "") {
      return null;
    } else {
      return _password.value = "Password is invalid";
    }
  }

//VALIDA REMEMBERPASSWORD
  bool? get rememPassValid => GetUtils.isEmail(_rememberPass.value.trim());
  String? get rememPassErr {
    if (GetUtils.isEmail(_rememberPass.value.trim())) {
      return null;
    } else {
      return _rememberPass.value = "Invalid Email";
    }
  }

  ///Habilita BUTTON
  bool get formValid => (emailValid)! && (passwordValid)!;

  /**********************************/

}
