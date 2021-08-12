import 'package:flutter/material.dart';
import 'formBasicInfo.dart';

class BasicInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: formBasicInfo(),
      ),
    );
  }
}
