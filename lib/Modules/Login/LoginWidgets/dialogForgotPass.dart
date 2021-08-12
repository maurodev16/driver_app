import 'package:driver_app/Modules/Login/loginController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<Null> showForgotPasswordDialog() async {
  await Get.dialog(
    GetBuilder<LoginController>(
      builder: (controller) => AlertDialog(
        title: const Text('Insira o mesmo email utilizado no cadastro.'),
        contentPadding: EdgeInsets.all(5.0),
        content: new TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: new InputDecoration(
            hintText: "Your Email",
            errorText: controller.rememPassErr,
          ),
          onChanged: (value) => controller.setRememberPass = value,
        ),
        actions: <Widget>[
          new TextButton(
            child: new Text("Cancel"),
            onPressed: () async {
              Get.back();
            },
          ),
          new TextButton(
            child: new Text("Send"),
            onPressed: () {
              Get.back();
              Get.snackbar(
                "Great..",
                "voce recebera um email para recuperar seua senha!",
                duration: Duration(seconds: 5),
              );
            },
          ),
        ],
      ),
    ),
  );
}
