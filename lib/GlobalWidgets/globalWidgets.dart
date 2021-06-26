import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rider_app/Controllers/authController.dart';

Widget drawerWidget(BuildContext context) {
  final userDataStored = GetStorage();
  final AuthController ctr = Get.put(AuthController());
  return Container(
    color: Colors.white,
    width: 255.0,
    child: Drawer(
      child: ListView(
        children: [
          Container(
            height: 165.0,
            child: DrawerHeader(
              decoration: BoxDecoration(color: Colors.black),
              child: Row(
                children: [
                  SizedBox(width: 16.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        userDataStored.hasData('firstname')
                            ? "${userDataStored.read('firstname')}"
                            : "",
                        style: TextStyle(
                          color: Colors.white54,
                          fontFamily: "BalooTammaMedium",
                          fontSize: 11.0,
                        ),
                      ),
                      SizedBox(width: 6.0),
                      Text(
                        "My Profile".tr,
                        style: TextStyle(
                          color: Colors.white54,
                          fontFamily: "BalooTammaMedium",
                          fontSize: 15.0,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(width: 16.0),
          ListTile(
            leading: Icon(
              Icons.person_outline,
              color: Colors.blueGrey,
            ),
            title: Text(
              'Profile'.tr,
              style: TextStyle(
                color: Colors.white,
                fontFamily: "BalooTammaMedium",
                fontSize: 15.0,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.history_outlined,
              color: Colors.blueGrey,
            ),
            title: Text(
              'History'.tr,
              style: TextStyle(
                color: Colors.white,
                fontFamily: "BalooTammaMedium",
                fontSize: 15.0,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.info_outline,
              color: Colors.blueGrey,
            ),
            title: Text(
              'About'.tr,
              style: TextStyle(
                color: Colors.white,
                fontFamily: "BalooTammaMedium",
                fontSize: 15.0,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Get.toNamed('/langPage');
            },
            child: ListTile(
              leading: Icon(
                Icons.language_outlined,
                color: Colors.blueGrey,
              ),
              title: Text(
                'Language'.tr,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "BalooTammaMedium",
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () => ctr.signOut(),
            child: ListTile(
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.blueGrey,
              ),
              title: Text(
                'Logout'.tr,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "BalooTammaMedium",
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
