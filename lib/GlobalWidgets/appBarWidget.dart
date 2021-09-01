import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar() {
  final icon = CupertinoIcons.moon_stars;
  return AppBar(
    backgroundColor: Colors.transparent,
    leading: BackButton(
      onPressed: () {},
    ),
    elevation: 0,
    actions: [
      IconButton(
        onPressed: () {},
        icon: Icon(icon),
      ),
    ],
  );
}
