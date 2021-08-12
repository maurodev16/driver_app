import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'securBtnInfo.dart';
import 'securInfoController.dart';

Widget formSecurInfo() {
  final SecurInfoController controller = Get.find();
  return Form(
    child: Container(
      padding: EdgeInsets.only(top: Get.height / 2.5, left: 10, right: 10),
      child: Column(
        children: [
          Text("Security Information"),
          SizedBox(height: 10.0),
          Obx(
            () => TextFormField(
              autofocus: false,
              obscureText: controller.getObscureText,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'Password',
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
          ),
          SizedBox(height: 10.0),
          Obx(
            () => TextFormField(
              autofocus: false,
              obscureText: controller.getObscureText,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'Repeat Password',
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
          ),
          SizedBox(height: 10.0),
          securBtnInfo(),
        ],
      ),
    ),
  );
}
