import 'package:driver_app/GlobalWidgets/appBarWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Widgets/buildCardNotif.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: buildAppBar(
        Text(
          "Benachrichtigung",
          style: TextStyle(color: Colors.white),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(CupertinoIcons.bell),
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (buildContext, index) {
          return buildCardNotif();
        },
      ),
    );
  }
}
