import 'package:driver_app/GlobalWidgets/timeline.dart';
import 'package:flutter/material.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: statusTimeLine(),
    );
  }
}