import 'package:driver_app/Routers/appRouters.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'homeController.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextButton(
              onPressed: () {
                Get.offNamed(AppRoutes.LOGINPAGE);
              },
              child: Text('Fazer Login?'),
            ),
            TextButton(
              onPressed: () {
                Get.offNamed(AppRoutes.BASICINFOPAGE);
              },
              child: Text('Se Registrar?'),
            ),
          ],
        ),
      ),
    );
  }
}
