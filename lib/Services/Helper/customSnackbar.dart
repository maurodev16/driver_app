import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constColors.dart';

customSnackbar(
  String title,
  String message, {
  Duration animationDuration,
  Color backgroundColor,
  Gradient backgroundGradient,
  double barBlur,
  Color borderColor,
  double borderRadius,
  double borderWidth,
  List<BoxShadow> boxShadows,
  Color colorText,
  SnackDismissDirection dismissDirection,
  Duration duration,
  Curve forwardAnimationCurve,
  Widget icon,
  bool instantInit,
  bool isDismissible,
  Color leftBarIndicatorColor,
  TextButton mainButton,
  EdgeInsets margin,
  double maxWidth,
  Widget messageText,
  void Function(GetBar<Object>) onTap,
  double overlayBlur,
  Color overlayColor,
  EdgeInsets padding,
  Color progressIndicatorBackgroundColor,
  AnimationController progressIndicatorController,
  Animation<Color> progressIndicatorValueColor,
  Curve reverseAnimationCurve,
  bool shouldIconPulse,
  bool showProgressIndicator,
  SnackPosition snackPosition,
  SnackStyle snackStyle,
  void Function(SnackbarStatus) snackbarStatus,
  Widget titleText,
  Form userInputForm,
}) {
  Get.snackbar(
    title,
    message,
    duration: Duration(seconds: 3),
    backgroundColor: mBrown,
    colorText: mWhite,
  );
}
