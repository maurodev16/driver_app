import 'dart:io';

import 'package:driver_app/Modules/Splash/SplashPage.dart';
import 'package:driver_app/Routers/appPages.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Modules/PageNotfound/pageNotfound.dart';
import 'Modules/Splash/SplashBinding.dart';

void _enablePlatformOverrideForDesktop() {
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux)) {
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _enablePlatformOverrideForDesktop();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Umzugi - Firma',
      theme: ThemeData(
        primaryColor: Colors.blue.shade300,
      ),
      home: SplashPage(), //ContainerPage(),
      initialBinding: SplashBinding(),
      // HomeBinding(), // BasicInfoBinding(), //ContainerBinding(),
      getPages: AppPages.appPages,
      unknownRoute: GetPage(name: '/pageNotfound', page: () => PageNotfound()),
    );
  }
}
