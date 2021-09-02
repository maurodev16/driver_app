import 'package:driver_app/GlobalWidgets/appBarWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          buildAppBar(Text("Einstellungen"), Icon(CupertinoIcons.moon_stars)),
      body: Center(
        child: Text("Settings Page"),
      ),
    );
  }
}
