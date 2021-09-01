import 'package:avatar_glow/avatar_glow.dart';
import 'package:driver_app/Routers/appRouters.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'WelcomeController.dart';
import 'Widgets/animatedButtonUI .dart';
import 'Widgets/delayedAnimation.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelcomeController>(
      builder: (controller) => Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                AvatarGlow(
                  endRadius: 90,
                  duration: Duration(seconds: 2),
                  glowColor: Colors.white24,
                  repeat: true,
                  repeatPauseDuration: Duration(seconds: 2),
                  startDelay: Duration(seconds: 1),
                  child: Material(
                    elevation: 0.0,
                    shape: CircleBorder(
                      side: BorderSide(color: Colors.yellow, width: 1),
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[100],
                      child: FlutterLogo(
                        size: 50.0,
                      ),
                      radius: 50.0,
                    ),
                  ),
                ),
                DelayedAnimation(
                  child: Text(
                    "Welcome",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.grey[200],
                    ),
                  ),
                  delay: Get.find<WelcomeController>().delaydAmount + 800,
                ),
                SizedBox(height: 30.0),
                DelayedAnimation(
                  child: Text(
                    "to",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.grey[200],
                    ),
                  ),
                  delay: Get.find<WelcomeController>().delaydAmount + 900,
                ),
                SizedBox(height: 30.0),

                DelayedAnimation(
                  child: Text(
                    "TRADI",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35.0,
                      color: Colors.grey[200],
                    ),
                  ),
                  delay: Get.find<WelcomeController>().delaydAmount + 900,
                ),

                SizedBox(
                  height: 50.0,
                ),
                //BOTAO DE LOGIN
                DelayedAnimation(
                  child: GestureDetector(
                    onTap: () {
                      print("Clicado o login");
                    },
                    onTapDown: onTapDown,
                    onTapUp: onTapUp,
                    child: Transform.scale(
                      scale: 0.8,
                      child: buttonSigninUI,
                    ),
                  ),
                  delay: Get.find<WelcomeController>().delaydAmount + 1100,
                ),
                SizedBox(height: 20.0),

                //BOTAO CRIAR CONTA
                DelayedAnimation(
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.BASICINFOPAGE);
                    },
                    onTapDown: onTapDown,
                    onTapUp: onTapUp,
                    child: Transform.scale(
                      scale: 0.8,
                      child: buttonSignupUI,
                    ),
                  ),
                  delay: Get.find<WelcomeController>().delaydAmount + 1200,
                ),
                TextButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.PROFILEPAGE);
                    },
                    child: Text("Profile")),
                SizedBox(
                  height: 50.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
