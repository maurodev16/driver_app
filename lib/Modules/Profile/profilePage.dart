import 'package:driver_app/GlobalWidgets/appBarWidget.dart';
import 'package:driver_app/Modules/Profile/widgets/avatarWidget.dart';
import 'package:driver_app/Utils/driverPreference.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets/infosWidget.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final driverModel = DriverPreferences.myDriver;
    return Scaffold(
      appBar: buildAppBar(Text("Profile"), Icon(CupertinoIcons.bell_circle)),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          AvatarWidget(
            driverAvatarUrl: driverModel.driverAvatarUrl,
            onClicked: () {},
          ),
          SizedBox(height: 10),
          InfosWidget(),
        ],
      ),
    );
  }
}
