// ignore: import_of_legacy_library_into_null_safe
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../containerController.dart';

Widget buildNavbarWidget() {
  return GetBuilder<ContainerController>(
    builder: (controller) {
      return BottomNavyBar(
        itemCornerRadius: 24,
        iconSize: 20,
        showElevation: false,
        selectedIndex: controller.getIndexSelected,
        onItemSelected: (index) {
          controller.setIndexSelected = index;
          controller.pageController.jumpToPage(index);
          controller.pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 300),
            curve: Curves.ease,
          );
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(CupertinoIcons.bell_circle),
            title: Text("Benachrichtigung"),
            activeColor: Colors.blue,
            inactiveColor: Colors.grey,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(CupertinoIcons.profile_circled),
            title: Text('Profil'),
            activeColor: Colors.blue,
            inactiveColor: Colors.grey,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(CupertinoIcons.settings),
            title: Text('Einstellungen'),
            activeColor: Colors.blue,
            inactiveColor: Colors.grey,
            textAlign: TextAlign.center,
          ),
        ],
      );
    },
  );
}
