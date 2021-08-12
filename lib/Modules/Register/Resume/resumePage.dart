import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Widgets/resumeForm.dart';
import 'resumeController.dart';

class ResumePage extends StatelessWidget {
  const ResumePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResumeController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text('Resume Page'),
        ),
        body: SingleChildScrollView(
          child: resumeForm(),
        ),
      ),
    );
  }
}
