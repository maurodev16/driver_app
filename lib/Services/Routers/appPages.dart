import 'package:get/get.dart';
import 'package:rider_app/Pages/AuthPages/registrationPage.dart';
import 'package:rider_app/Pages/HomePage/homePage.dart';
import 'package:rider_app/Pages/LanguagePage/LangPage.dart';
import 'package:rider_app/Pages/SearchPage/searchPage.dart';
import 'package:rider_app/Pages/SplashPage/loadingPage.dart';
import '../../Pages/AuthPages/loginPage.dart';

class MyPages {
  static final appPages = [
    GetPage(
      name: '/homePage',
      page: () => HomePage(),
      transition: Transition.fade,
    ),
    GetPage(
      name: '/loadingPage',
      page: () => LoadingPage(),
      transition: Transition.fade,
    ),
    GetPage(
        name: '/loginPage',
        page: () => LoginPage(),
        transition: Transition.fade),
    GetPage(
      name: '/signupPage',
      page: () => SignupPage(),
      transition: Transition.fade,
    ),
    GetPage(
      name: '/searchPage',
      page: () => SearchPage(),
      transition: Transition.fade,
    ),
    GetPage(
      name: '/langPage',
      page: () => LangPage(),
      transition: Transition.fade,
    ),
  ];
}
