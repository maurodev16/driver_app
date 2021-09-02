import 'package:driver_app/GlobalWidgets/appBarWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Widgets/buildCardNotif.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(Text("Benachrichtigung"), Icon(null)),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (buildContext, index) {
          return buildCardNotif();
        },
      ),
    );
  }
}
