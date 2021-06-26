import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UnknownPage extends StatelessWidget {
  static const String idPage = "unknownPageId";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Page not found!'.tr),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () => Get.toNamed('/homePage'),
              child: Text('Go back to Home Page'.tr),
            )
          ],
        ),
      ),
    );
  }
}
