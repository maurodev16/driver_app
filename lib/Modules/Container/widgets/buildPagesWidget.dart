import 'package:driver_app/Modules/Notification/notificationPage.dart';
import 'package:driver_app/Modules/Profile/profilePage.dart';
import 'package:driver_app/Modules/SettingsPage/settingsPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../containerController.dart';

Widget buildPagesWidget() => GetBuilder<ContainerController>(
      builder: (controller) => PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        onPageChanged: (index) {
          controller.setIndexSelected = index;
        },
        children: [
          NotificationPage(),
          ProfilePage(),
          SettingsPage(),
          Container(
            color: Colors.blue,
          ),
        ],
      ),
    );
