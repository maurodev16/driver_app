import 'package:flutter/material.dart';
import 'avatarForm.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: avatarForm(),
      ),
    );
  }
}
