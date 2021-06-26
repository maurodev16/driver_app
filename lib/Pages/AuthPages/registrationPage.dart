import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rider_app/Controllers/authController.dart';

class SignupPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20.0),

            ///IMAGE
            Image(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/login.jpg'),
              height: 150,
              alignment: Alignment.center,
            ),

            ///Title
            Text(
              'Transport-D',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "BalooTammaBold",
                color: Colors.black,
                fontSize: 25.0,
                letterSpacing: 2.0,
              ),
            ),

            Text(
              'Create your account'.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "BalooTammaBold",
                color: Colors.grey,
                fontSize: 18.0,
                letterSpacing: 2.0,
              ),
            ),

            ///Login Form
            Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    /// Input Name
                    GetBuilder<AuthController>(builder: (ctl) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          onChanged: (value) => ctl.setUsername = value,
                          keyboardType: TextInputType.text,
                          style: TextStyle(
                            fontFamily: "BalooTammaMedium",
                            color: Colors.blueGrey,
                            fontSize: 18.0,
                          ),
                          decoration: InputDecoration(
                              labelText: 'Name'.tr,
                              labelStyle: TextStyle(
                                fontFamily: "BalooTammaRegular",
                                color: Colors.blueGrey,
                                fontSize: 18.0,
                              ),
                              hintStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 14.0,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.blueGrey,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              )),
                        ),
                      );
                    }),

                    /// Input Email
                    GetBuilder<AuthController>(builder: (ctr) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          onChanged: (value) => ctr.setEmail = value,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                            fontFamily: "BalooTammaMedium",
                            color: Colors.blueGrey,
                            fontSize: 18.0,
                          ),
                          decoration: InputDecoration(
                              labelText: 'Email'.tr,
                              labelStyle: TextStyle(
                                fontFamily: "BalooTammaRegular",
                                color: Colors.blueGrey,
                                fontSize: 18.0,
                              ),
                              hintStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 14.0,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.blueGrey,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              )),
                        ),
                      );
                    }),

                    /// Input Phone
                    GetBuilder<AuthController>(builder: (ctr) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          onChanged: (value) => ctr.setPhone = value,
                          keyboardType: TextInputType.phone,
                          style: TextStyle(
                            fontFamily: "BalooTammaMedium",
                            color: Colors.blueGrey,
                            fontSize: 18.0,
                          ),
                          decoration: InputDecoration(
                              labelText: 'Phone'.tr,
                              labelStyle: TextStyle(
                                fontFamily: "BalooTammaRegular",
                                color: Colors.blueGrey,
                                fontSize: 18.0,
                              ),
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 14.0,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.blueGrey,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              )),
                        ),
                      );
                    }),

                    /// Input Password
                    GetBuilder<AuthController>(builder: (ctr) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          onChanged: (value) => ctr.setpassword = value,
                          obscureText: true,
                          style: TextStyle(
                            fontFamily: "BalooTammaMedium",
                            color: Colors.blueGrey,
                            fontSize: 18.0,
                          ),
                          decoration: InputDecoration(
                            labelText: 'Password'.tr,
                            labelStyle: TextStyle(
                              fontFamily: "BalooTammaRegular",
                              color: Colors.blueGrey,
                              fontSize: 18.0,
                            ),
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 14.0,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.blueGrey,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      );
                    }),

                    /// Input confirm
                    GetBuilder<AuthController>(builder: (ctr) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          onChanged: (value) => ctr.setconfirmPass = value,
                          obscureText: true,
                          style: TextStyle(
                            fontFamily: "BalooTammaMedium",
                            color: Colors.blueGrey,
                            fontSize: 18.0,
                          ),
                          decoration: InputDecoration(
                            labelText: 'Confirm Password'.tr,
                            labelStyle: TextStyle(
                              fontFamily: "BalooTammaRegular",
                              color: Colors.blueGrey,
                              fontSize: 18.0,
                            ),
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 14.0,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.blueGrey,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      );
                    }),

                    /// Input Buttom
                    GetBuilder<AuthController>(builder: (ctr) {
                      return ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            ctr.signUp(ctr.getEmail, ctr.getpassword);
                          } else {
                            return null;
                          }
                        },
                        child: Container(
                          height: 50.0,
                          child: Center(
                            child: Text(
                              'Create an account'.tr,
                              style: TextStyle(
                                fontFamily: "BalooTammaRegular",
                                color: Colors.white,
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                        ),
                      );
                    })
                  ],
                ),
              ),
            ),
            TextButton(
              onPressed: () =>
                  Get.offNamedUntil('/loginPage', (route) => false),
              child: Text(
                'Already have an account? Login here'.tr,
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
