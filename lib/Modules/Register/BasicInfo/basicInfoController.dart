import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BasicInfoController extends GetxController with StateMixin {
  final basicformKey = GlobalKey();
  var _companyName = ''.obs;
  var _firstname = ''.obs;
  var _password = ''.obs;
  var _email = ''.obs;

  RxString get getCompanyName => this._companyName;
  set setCompanyName(value) {
    this._companyName.value = value;
    update();
  }

  RxString get getFirstname => this._firstname;
  set setFirstname(value) {
    this._firstname.value = value;
    update();
  }

  RxString get getEmail => this._email;
  set setEmail(value) {
    this._email.value = value;
    update();
  }

  RxString get getPassword => this._password;
  set setLastname(value) {
    this._password.value = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }

//VALIS FIRSTNAME
  bool? get firstNameValid => GetUtils.isUsername(_firstname.value.trim());
  String? get firstnameErr {
    if (GetUtils.isUsername(_firstname.value.trim())) {
      return null;
    } else {
      return _firstname.value = "First name is invalid";
    }
  }

//VALIDA LASTNAME
  bool? get lastnameValid => GetUtils.isUsername(_password.value.trim());
  String? get lastnameErr {
    if (GetUtils.isUsername(_password.value.trim())) {
      return null;
    } else {
      return _password.value = "Last name is invalid";
    }
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

  ///VALIDA BUTTON
  bool get formValid => (firstNameValid)! && (lastnameValid)! && (emailValid)!;
}
