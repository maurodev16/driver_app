import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rider_app/Controllers/authController.dart';

class LoginPage extends GetWidget<AuthController> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50.0),

            ///IMAGE
            Image(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/login.jpg'),
              height: 200,
              alignment: Alignment.center,
            ),
            SizedBox(height: 10.0),

            ///Title
            Text(
              "Transport-D",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "BalooTammaBold",
                color: Colors.black,
                fontSize: 25.0,
                letterSpacing: 2.0,
              ),
            ),

            ///Login Form
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    ///Email controller
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.tealAccent,
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) =>
                              value.isEmpty ? 'email invalid'.tr : null,
                          style: TextStyle(
                            fontFamily: "BalooTammaMedium",
                            color: Colors.black,
                            fontSize: 18.0,
                          ),
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                              fontFamily: "BalooTammaRegular",
                              color: Colors.blueGrey,
                              fontSize: 18.0,
                            ),
                            hintStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                            ),
                            hintText: "Email".tr,
                            suffixIcon: Icon(
                              Icons.email_outlined,
                              color: Colors.red,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(15),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.tealAccent,
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: TextFormField(
                            validator: (value) => value.length < 6
                                ? 'Enter password 6+ chars long'.tr
                                : null,
                            controller: passwordController,
                            style: TextStyle(
                              fontFamily: "BalooTammaMedium",
                              color: Colors.blueGrey,
                              fontSize: 18.0,
                            ),
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Password'.tr,
                              suffixIcon: Icon(
                                Icons.remove_red_eye_outlined,
                                color: Colors.red,
                              ),
                              labelStyle: TextStyle(
                                fontFamily: "BalooTammaRegular",
                                color: Colors.blueGrey,
                                fontSize: 18.0,
                              ),
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 14.0,
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(15),
                            )),
                      ),
                    ),

                    SizedBox(height: 10.0),

                    /// Buttom Login
                    ElevatedButton(
                      style: ButtonStyle(),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          controller.login(
                            emailController.text,
                            passwordController.text,
                          );
                        } else {
                          // ignore: unnecessary_statements
                          null;
                        }
                      },
                      child: Container(
                        height: 50.0,
                        child: Center(
                          child: Text(
                            'Login'.tr,
                            style: TextStyle(
                              fontFamily: "BalooTammaRegular",
                              color: Colors.white,
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// Buttom do not have an accont?
            TextButton(
              onPressed: () =>
                  Get.offNamedUntil('/signupPage', (route) => false),
              child: Text(
                'Do not have an account? Register here.'.tr,
                style: TextStyle(
                  fontFamily: "BalooTammaRegular",
                  color: Colors.black,
                  fontSize: 14.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
