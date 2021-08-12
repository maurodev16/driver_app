import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'securInfoController.dart';
import 'formSecurInfo.dart';

class SecurInfoPage extends StatelessWidget {
  const SecurInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SecurInfoController>(
      builder: (controller) => Scaffold(
        body: SingleChildScrollView(
          child: formSecurInfo(),
        ),
      ),
    );
  }
}
