import 'package:driver_app/Modules/Container/containerBinding.dart';
import 'package:driver_app/Modules/Container/containerPage.dart';
import 'package:driver_app/Modules/Home/homeBinding.dart';
import 'package:driver_app/Modules/Home/homePage.dart';
import 'package:driver_app/Modules/Login/loginBinding.dart';
import 'package:driver_app/Modules/Login/loginPage.dart';
import 'package:driver_app/Modules/Profile/profileBinding.dart';
import 'package:driver_app/Modules/Profile/profilePage.dart';
import 'package:driver_app/Modules/Register/Address/addressBinding.dart';
import 'package:driver_app/Modules/Register/Address/addressPage.dart';
import 'package:driver_app/Modules/Register/Avatar/avatarBinding.dart';
import 'package:driver_app/Modules/Register/Avatar/avatarPage.dart';
import 'package:driver_app/Modules/Register/BasicInfo/basicInfoBinding.dart';
import 'package:driver_app/Modules/Register/BasicInfo/basicPage.dart';
import 'package:driver_app/Modules/Register/Resume/resumeBinding.dart';
import 'package:driver_app/Modules/Register/Resume/resumePage.dart';
import 'package:driver_app/Modules/Register/SecurityInfo/securInfoBinding.dart';
import 'package:driver_app/Modules/Register/SecurityInfo/securInfoPage.dart';
import 'package:driver_app/Modules/Register/UploadFile/uploadBinding.dart';
import 'package:driver_app/Modules/Register/UploadFile/uploadFile.dart';
import 'package:driver_app/Modules/Welcome/WelcomeBinding.dart';
import 'package:driver_app/Modules/Welcome/WelcomePage.dart';
import 'package:get/route_manager.dart';

import 'appRouters.dart';

class AppPages {
  static final List<GetPage> appPages = [
    GetPage(
      name: AppRoutes.CONTAINERPAGE,
      page: () => ContainerPage(),
      binding: ContainerBinding(),
      transition: Transition.cupertinoDialog,
    ),
    GetPage(
      name: AppRoutes.WELCOMEPAGE,
      page: () => WelcomePage(),
      binding: WelcomeBinding(),
      transition: Transition.cupertinoDialog,
    ),
    GetPage(
      name: AppRoutes.HOMEPAGE,
      page: () => HomePage(),
      binding: HomeBinding(),
      transition: Transition.cupertinoDialog,
    ),
    GetPage(
      name: AppRoutes.LOGINPAGE,
      page: () => LoginPage(),
      binding: LoginBinding(),
      transition: Transition.cupertinoDialog,
    ),
    GetPage(
      name: AppRoutes.BASICINFOPAGE,
      page: () => BasicInfoPage(),
      binding: BasicInfoBinding(),
      transition: Transition.cupertinoDialog,
    ),
    GetPage(
      name: AppRoutes.ADDRESSPAGE,
      page: () => AddressPage(),
      binding: AddressBinding(),
      transition: Transition.cupertinoDialog,
    ),
    GetPage(
      name: AppRoutes.UPLOADFILEPAGE,
      page: () => UploadFilePage(),
      binding: UploadFileBinding(),
      transition: Transition.cupertinoDialog,
    ),
    GetPage(
      name: AppRoutes.SECURINFOPAGE,
      page: () => SecurInfoPage(),
      binding: SecurInfoBinding(),
      transition: Transition.cupertinoDialog,
    ),
    GetPage(
      name: AppRoutes.AVATARPAGE,
      page: () => AvatarPage(),
      binding: AvatarBinding(),
      transition: Transition.cupertinoDialog,
    ),
    GetPage(
      name: AppRoutes.RESUMEPAGE,
      page: () => ResumePage(),
      binding: ResumeBinding(),
      transition: Transition.cupertinoDialog,
    ),
    GetPage(
      name: AppRoutes.PROFILEPAGE,
      page: () => ProfilePage(),
      binding: ProfileBinding(),
      transition: Transition.cupertinoDialog,
    ),
  ];
}
