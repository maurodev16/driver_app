import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:rider_app/Models/UserModel/userModel.dart';
import 'package:rider_app/Pages/AuthPages/GlobalWidget/progressDialog.dart';
import 'package:rider_app/Services/Enums/enums.dart';
import 'package:rider_app/Services/Helper/utility.dart';

import 'googleMapsController.dart';

class AuthController extends GetxController {
  AuthStatusEnum authStatusEnum = AuthStatusEnum.NOT_DETERMINED;
  var _googleMapsController = Get.put(GoogleMapsController());
  //firebaseUser.bindStream(auth.authStateChanges());

  var _username = "".obs;
  String get getUsername => _username.value;
  set setUsername(String value) {
    _username.value = value;
    update();
  }

  var _email = "".obs;
  String get getEmail => _email.value;
  set setEmail(String value) {
    _email.value = value;
    update();
  }

  var _password = "".obs;
  String get getpassword => _password.value;
  set setpassword(String value) {
    if (_password.value.isEmpty || _password.value == null) {
      Get.snackbar(
        'Attention'.tr,
        'Fill password',
        animationDuration: Duration(seconds: 3),
        icon: Icon(Icons.warning_amber_outlined),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.black,
        shouldIconPulse: true,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
    }
    _password.value = value;
    update();
  }

  var _confirmPass = "".obs;
  String get getconfirmPass => _confirmPass.value;
  set setconfirmPass(String value) {
    _confirmPass.value = value;
    update();
  }

  var _phone = "".obs;
  get getPhone => _phone.value;
  set setPhone(String value) {
    _phone.value = value;
    update();
  }

  ///
  @override
  void onInit() async {
    //firebaseUser.bindStream(auth.authStateChanges());
    getCurrentUserOnlineInfo();
    userDataStored.writeIfNull('isUserLogedIn', false);

    Future.delayed(Duration.zero, () async {
      await checkIfUserIsLogged();
    });

    super.onInit();
  }

  UserModel _userModelFromFirebase(User userF) {
    return userF != null ? UserModel(id: userF.uid) : null;
  }

  static void getCurrentUserOnlineInfo() async {
    firebaseUser = FirebaseAuth.instance.currentUser;
    String userId = firebaseUser?.uid;
    userRef.child(userId).once().then(
      (DataSnapshot dataSnapshot) {
        if (dataSnapshot.value != null) {
          userCurrentInfoModel = UserModel.fromSnapshot(dataSnapshot);
        }
      },
    ).catchError(
      (e) {
        print(e.toString());
      },
    );
  }

  Future saveRideRequestOnFirebase() async {
    var pickUp = _googleMapsController.pickupLocation;
    var dropOff = _googleMapsController.dropOffLocation;

    Map pickUpLocMap = {
      "latitude": pickUp.latitude.toString(),
      "longitude": pickUp.longitude.toString(),
    };
    Map dropOffLocMap = {
      "latitude": dropOff.latitude.toString(),
      "longitude": dropOff.longitude.toString(),
    };

    Map rideInfoMap = {
      "driver_id": "waiting",
      "payment_method": "cash",
      "pickup": pickUpLocMap,
      "dropoff": dropOffLocMap,
      "created_at": DateTime.now().toString(),
      "ride_name": userCurrentInfoModel.username,
      "ride_phone": userCurrentInfoModel.phone,
      "pickup_address": pickUp.placeName,
      "dropoff_address": dropOff.placeName,
    };
    await userRideInfoRef.set(rideInfoMap);
    update();
  }

  ///LOGIN USER ON DATABASE
  Future login(String email, String password) async {
    authStatusEnum = AuthStatusEnum.NOT_LOGGED_IN;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      firebaseUser = userCredential.user;
      if (firebaseUser != null) {
        userRef.child(firebaseUser.uid).once().then((DataSnapshot snapshot) {
          if (snapshot.value != null) {
            userDataStored.write('isUserLogedIn', true);
            userDataStored.write('userId', userCredential.user.uid);
            userDataStored.write('email', snapshot.value["email"]);
            userDataStored.write('name', snapshot.value["firstname"]);
            userDataStored.write('lastname', snapshot.value["lastname"]);
            userDataStored.write('phone', snapshot.value["phone"]);
            Get.dialog(
              ProgressDialog(
                message: 'Authenticating, Please wait..'.tr,
              ),
              transitionDuration: Duration(seconds: 3),
              barrierDismissible: false,
            );
            Get.offNamed('/homePage', arguments: (route) => false);
            Get.snackbar(
              "Wellcome",
              "You have been successfully logged in",
              animationDuration: Duration(seconds: 3),
              icon: Icon(Icons.check),
              duration: Duration(seconds: 3),
              backgroundColor: Colors.black,
              shouldIconPulse: true,
              colorText: Colors.white,
              snackPosition: SnackPosition.TOP,
            );
            authStatusEnum = AuthStatusEnum.LEGGED_IN;
          } else {
            Get.snackbar(
              "Attention",
              "No record exists for this user, Please create a new account.",
              animationDuration: Duration(seconds: 5),
              icon: Icon(Icons.check),
              duration: Duration(seconds: 5),
              backgroundColor: Colors.black,
              shouldIconPulse: true,
              colorText: Colors.white,
              snackPosition: SnackPosition.TOP,
            );
            authStatusEnum = AuthStatusEnum.NOT_LOGGED_IN;
            signOut();
          }
        });
      }

      return _userModelFromFirebase(firebaseUser);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        Get.snackbar(
          'Attention'.tr,
          'email address is not valid'.tr,
          animationDuration: Duration(seconds: 3),
          icon: Icon(Icons.warning_amber_outlined),
          duration: Duration(seconds: 3),
          backgroundColor: Colors.black,
          shouldIconPulse: true,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
        );
        return;
      } else if (e.code == 'user-disabled') {
        Get.snackbar(
          'Attention'.tr,
          'the given email has been disabled'.tr,
          animationDuration: Duration(seconds: 3),
          icon: Icon(Icons.warning_amber_outlined),
          duration: Duration(seconds: 3),
          backgroundColor: Colors.black,
          shouldIconPulse: true,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
        );
      } else if (e.code == 'user-not-found') {
        Get.snackbar(
          'Attention'.tr,
          'there is no user corresponding to the given email'.tr,
          animationDuration: Duration(seconds: 3),
          icon: Icon(Icons.warning_amber_outlined),
          duration: Duration(seconds: 3),
          backgroundColor: Colors.black,
          shouldIconPulse: true,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
        );
      } else if (e.code == 'wrong-password') {
        Get.snackbar(
          'Attention'.tr,
          'the password is invalid for the given email, or the account corresponding to the email does not have a password set'
              .tr,
          animationDuration: Duration(seconds: 3),
          icon: Icon(Icons.warning_amber_outlined),
          duration: Duration(seconds: 3),
          backgroundColor: Colors.black,
          shouldIconPulse: true,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error sign In'.tr,
        e.message,
        animationDuration: Duration(seconds: 3),
        icon: Icon(Icons.error),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.black,
        shouldIconPulse: true,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
    }
    update();
  }

  ///Create an User
  Future signUp(String email, String password) async {
    authStatusEnum = AuthStatusEnum.NOT_LOGGED_IN;
    try {
      User userCredential = (await auth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user;

      if (userCredential != null) {
        Map userMapModel = {
          "username": _username.value,
          "email": _email.value,
          "phone": _phone.value,
          "createdAt": DateTime.now().toString(),
        };
        //GRAVA NO BANCO DE DADOS
        userRef.child(userCredential.uid).set(userMapModel);

        Get.dialog(
          ProgressDialog(
            message: 'Please wait..'.tr,
          ),
          transitionDuration: Duration(seconds: 3),
          barrierDismissible: false,
        );
        userDataStored.write('isUserLogedIn', true);
        userDataStored.write('userId', userCredential.uid);
        userDataStored.write('email', userCredential.email);
        userDataStored.write('name', userCredential.displayName);
        userDataStored.write('phone', userCredential.phoneNumber);

        Get.snackbar(
          'Great!'.tr,
          'Registration successful.'.tr,
          animationDuration: Duration(seconds: 3),
          icon: Icon(FontAwesomeIcons.registered),
          duration: Duration(seconds: 3),
          backgroundColor: Colors.black,
          shouldIconPulse: true,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
        );
        Get.offNamedUntil('/homePage', (route) => false);
        authStatusEnum = AuthStatusEnum.LEGGED_IN;
      }

      return _userModelFromFirebase(userCredential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar(
          'Attention'.tr,
          'The password provided is too weak'.tr,
          animationDuration: Duration(seconds: 3),
          icon: Icon(Icons.warning_amber_outlined),
          duration: Duration(seconds: 3),
          backgroundColor: Colors.black,
          shouldIconPulse: true,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
        );
        return;
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar(
          'Attention'.tr,
          'Already exists an account with the given email address'.tr,
          animationDuration: Duration(seconds: 3),
          icon: Icon(Icons.warning_amber_outlined),
          duration: Duration(seconds: 3),
          backgroundColor: Colors.black,
          shouldIconPulse: true,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
        );
      } else if (e.code == 'invalid-email') {
        Get.snackbar(
          'Attention'.tr,
          'Email address is not valid'.tr,
          animationDuration: Duration(seconds: 3),
          icon: Icon(Icons.warning_amber_outlined),
          duration: Duration(seconds: 3),
          backgroundColor: Colors.black,
          shouldIconPulse: true,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
        );
      } else if (e.code == 'operation-not-allowed') {
        Get.snackbar(
          'Attention'.tr,
          'email/password accounts are not enabled, please contact app support'
              .tr,
          animationDuration: Duration(seconds: 3),
          icon: Icon(Icons.warning_amber_outlined),
          duration: Duration(seconds: 3),
          backgroundColor: Colors.black,
          shouldIconPulse: true,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error Registration'.tr,
        e.message,
        animationDuration: Duration(seconds: 3),
        icon: Icon(Icons.error),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.black,
        shouldIconPulse: true,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
    }
    update();
  }

  ///RESET PASSWORD
  Future resetPassword(String email) async {
    try {
      return await auth.sendPasswordResetEmail(email: email);
    } catch (e) {}
  }

  /// LOGIN USER WITH PHONE NUMBER
  void loginWithPhoneNamber(UserModel userModel) async {
    try {
      await auth.signInWithPhoneNumber(userModel.phone);
    } catch (e) {}
  }

  Future signOut() async {
    try {
      userDataStored.write('isUserLogedIn', false);
      userDataStored.remove('username');
      await auth.signOut();
      Get.offNamed('/loginPage');
    } catch (e) {
      Get.snackbar(
        'Error sign Out, try again'.tr,
        e.message.toString(),
        animationDuration: Duration(seconds: 3),
        icon: Icon(Icons.error),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.black,
        shouldIconPulse: true,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
      Get.back();
    }
  }

  Future<void> checkIfUserIsLogged() async {
    return await userDataStored.read('isUserLogedIn')
        ? Get.offAllNamed('/homePage')
        : Get.offAllNamed('/loginPage');
  }
}
