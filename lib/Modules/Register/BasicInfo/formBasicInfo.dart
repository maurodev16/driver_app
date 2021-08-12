import 'package:driver_app/Modules/Register/BasicInfo/basicInfoController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'btnBasicInfo.dart';

Widget formBasicInfo() {
  return GetBuilder<BasicInfoController>(
    builder: (controller) => FormBuilder(
      key: Get.find<BasicInfoController>().basicformKey,
      onChanged: () => print("Form has bin changed"),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Container(
        padding: EdgeInsets.only(top: Get.height / 4, left: 10, right: 10),
        child: Column(
          children: [
            Text("Basic Information"),
            SizedBox(height: 10.0),
            // FirstName
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onChanged: (value) => controller.setFirstname = value,
              autofocus: false,
              decoration: InputDecoration(
                hintText: 'First Name',
                errorText: controller.firstnameErr,
                hintStyle: TextStyle(color: Colors.grey),
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
                suffixIcon: controller.firstnameErr == null
                    ? Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 20,
                      )
                    : Icon(Icons.error, color: Colors.red),
              ),
            ),
            //LASTNAME
            SizedBox(height: 10.0),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onChanged: (value) => controller.setLastname = value,
              autofocus: false,
              decoration: InputDecoration(
                hintText: 'Last Name',
                errorText: Get.find<BasicInfoController>().lastnameErr,
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
                suffixIcon: controller.lastnameErr == null
                    ? Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 20,
                      )
                    : Icon(Icons.error, color: Colors.red),
              ),
            ),

            SizedBox(height: 10.0),
            //EMAIL
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onChanged: (value) => controller.setEmail = value,
              keyboardType: TextInputType.emailAddress,
              autofocus: false,
              decoration: InputDecoration(
                hintText: 'E-mail',
                errorText: controller.emailErr,
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
                suffixIcon: controller.emailErr == null
                    ? Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 20,
                      )
                    : Icon(Icons.error, color: Colors.red),
              ),
            ),

            basicInfoNextBackBtn(),
          ],
        ),
      ),
    ),
  );
}
