import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rider_app/Services/Routers/appPages.dart';

import 'Bindings/binding.dart';
import 'Pages/HomePage/homePage.dart';
import 'Pages/LanguagePage/translationsService.dart';
import 'Pages/UnknownPage/unknownPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final userDataStored = GetStorage();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: MyBinding(),
      translations: TranslationsService(),
      locale: TranslationsService.locale,
      fallbackLocale: TranslationsService.fallBackLocale,
      navigatorKey: Get.key,
      defaultTransition: Transition.fade,
      title: 'Möbelliefer',
      theme: ThemeData.dark(),
      //initialRoute: '/loginPage',
      home: HomePage(),
      getPages: MyPages.appPages,
      unknownRoute: GetPage(
        name: '/unknownPage',
        page: () => UnknownPage(),
        transition: Transition.fade,
      ),
    );
  }
}
