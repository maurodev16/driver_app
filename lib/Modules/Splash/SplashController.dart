import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:driver_app/Data/Models/userModel.dart';
import 'package:driver_app/Routers/appRouters.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription _streamSubscription;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final String _userDataKey = 'userDataKey';
  var _isOnline = false.obs;

  RxBool get isOnline => _isOnline;

  @override
  void onInit() async {
    _streamSubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);

    Future.delayed(Duration(seconds: 5), () {
      verifyIfHasUserData();
    });
    super.onInit();
  }

  @override
  void onClose() {
    _streamSubscription.cancel();
    super.onClose();
  }

  //********CHECKING INTERNET CONECTION********** */

  Future<void> startVerifyInternet() async {
    var connectivityResult;
    try {
      connectivityResult = await (_connectivity.checkConnectivity());
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return _updateConnectionStatus(connectivityResult);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
        _isOnline.value = true;
        update();
        break;
      case ConnectivityResult.mobile:
        _isOnline.value = true;
        update();
        break;
      case ConnectivityResult.none:
        _isOnline.value = false;
        update();
        break;
      default:
        Get.snackbar("", 'Keine Internetverbindung',
            icon: Icon(CupertinoIcons.wifi_slash),
            duration: Duration(seconds: 3));
    }
  }

//******LOCAL STORAGE*******/
  Future<void> setUserDataToLocalStorage(UserModel userModel) async {
    final prefs = await _prefs;
    await prefs.setString(_userDataKey, userModel.toJson());
  }

  Future<UserModel?> getUserDataFromLocalStorage() async {
    final prefs = await _prefs;
    final String? userStringDate = prefs.getString(_userDataKey);
    if (userStringDate == null) {
      return null;
    } else {
      return UserModel.fromJson(userStringDate);
    }
  }

  Future<void> clearUserDataHive() async {
    final prefs = await _prefs;
    await prefs.clear();
  }

  Future<void> verifyIfHasUserData() async {
    final UserModel? userModelDate = await getUserDataFromLocalStorage();
    print('USER DATA MODEL IS: $userModelDate');
    if (userModelDate == null) {
      Get.offAllNamed(AppRoutes.LOGINPAGE);
    } else {
      Get.toNamed(AppRoutes.HOMEPAGE);
    }
    update();
  }
}
