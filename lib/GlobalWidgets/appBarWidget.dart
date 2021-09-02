import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(Widget title, Widget icon) {
  return AppBar(
    backgroundColor: Colors.transparent,
    centerTitle: true,
    title: title,
    elevation: 0,
    actions: [
      IconButton(
        onPressed: () {},
        icon: icon,
      ),
    ],
  );
}
