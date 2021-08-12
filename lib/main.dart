import 'package:driver_app/Routers/appPages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Modules/Welcome/WelcomeBinding.dart';
import 'Modules/Welcome/WelcomePage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Driver App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WelcomePage(),
      initialBinding: WelcomeBinding(),
      getPages: AppPages.appPages,
    );
  }
}
