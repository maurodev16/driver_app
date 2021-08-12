import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'uplodFileNextBackBtn.dart';

Widget uploadFileForm() {
  return Form(
    child: Container(
      padding: EdgeInsets.only(top: Get.height / 2.5, left: 10, right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Identifications Number"),
          SizedBox(height: 10.0),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Identifications Number',
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
              suffixIcon: Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 20,
              ),
            ),
          ),
          uplodFileNextBackBtn(),
        ],
      ),
    ),
  );
}
