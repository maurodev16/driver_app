import 'package:driver_app/Routers/appRouters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../loginController.dart';
import 'dialogForgotPass.dart';

Widget loginForm() {
  return GetBuilder<LoginController>(
    builder: (controller) => FormBuilder(
      key: Get.find<LoginController>().loginformKey,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: () {
                  Get.snackbar("title", "message");
                },
                child: Container(
                  padding: EdgeInsets.all(50),
                  child: CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.green,
                    child: CircleAvatar(
                      backgroundColor: Colors.green,
                      radius: 50,
                      backgroundImage: NetworkImage(
                        "https://de.web.img3.acsta.net/r_654_368/newsv7/20/09/28/08/25/5532219.jpg",
                      ),
                      //child: TextButton(onPressed: () {}, child: Text("bcb")),
                    ),
                  ),
                ),
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) => controller.setEmail = value,
              autofocus: false,
              decoration: InputDecoration(
                hintText: 'E-mail',
                errorText: controller.emailErr,
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              autofocus: false,
              onChanged: (value) => controller.setPassword = value,
              obscureText: controller.getObscureText,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'Password',
                errorText: controller.passwordErr,
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0)),
                suffixIcon: GestureDetector(
                  onTap: () {
                    controller.setObscureText = !controller.getObscureText;
                  },
                  child: Icon(
                    controller.getObscureText
                        ? Icons.visibility_off
                        : Icons.visibility,
                    semanticLabel: controller.getObscureText
                        ? 'show password'
                        : 'hide password',
                  ),
                ),
              ),
            ),
            SizedBox(height: 15.0),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: controller.formValid ? () {} : null,
                style: ButtonStyle(),
                child: Text("Log In"),
              ),
            ),
            TextButton(
              onPressed: () {
                showForgotPasswordDialog();
              },
              child: Text(
                'Forgot password?',
              ),
            ),
            TextButton(
              onPressed: () {
                Get.offNamed(AppRoutes.BASICINFOPAGE);
              },
              child: Text(
                'Sign up',
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
