import 'package:driver_app/Modules/Container/containerBinding.dart';
import 'package:driver_app/Modules/Container/containerPage.dart';
import 'package:driver_app/Routers/appPages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tra-di Für Fahrer',
      theme: ThemeData(
        primaryColor: Colors.blue.shade300,
      ),
      home: ContainerPage(),
      initialBinding: ContainerBinding(),
      getPages: AppPages.appPages,
    );
  }
}
