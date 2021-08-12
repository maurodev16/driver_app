import 'package:driver_app/Modules/Register/UploadFile/uploadFileForm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'uploadFileController.dart';

class UploadFilePage extends StatelessWidget {
  const UploadFilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UploadFileController>(
      builder: (controller) => Scaffold(
        body: SingleChildScrollView(
          child: uploadFileForm(),
        ),
      ),
    );
  }
}
