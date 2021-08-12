import 'package:flutter/material.dart';
import 'LoginWidgets/loginForm.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: loginForm(),
      ),
    );
  }
}
