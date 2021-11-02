import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'SplashController.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (controller) => Scaffold(
        body: AnnotatedRegion(
          value: SystemUiOverlayStyle.light,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.1, 0.4, 0.7, 0.9],
                colors: [
                  Color(0xFF44BD6A),
                  Color(0xFF4caF50),
                  Color(0xFF43a047),
                  Color(0xFF388e3c),
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  controller.isOnline.value
                      ? Text("")
                      : TextButton.icon(
                          label: Text('Keine Internetverbindung'),
                          icon: Icon(CupertinoIcons.wifi_slash),
                          onPressed: () {
                            Get.snackbar('Achtung!',
                                'Überprüfe deine Internetverbindung.',
                                icon: Icon(CupertinoIcons.wifi_slash),
                                duration: Duration(seconds: 3));
                          },
                        ),
                  Container(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: AnimatedTextKit(
                        totalRepeatCount: 1,
                        isRepeatingAnimation: false,
                        onFinished: () {
                          //controller.verifyIfHasUserData();
                        },
                        animatedTexts: [
                          ColorizeAnimatedText(
                            'Umzug',
                            textStyle: const TextStyle(
                              fontSize: 30.0,
                              fontFamily: 'BalooTammaRegular',
                            ),
                            colors: [
                              Colors.white,
                              Colors.green,
                              Colors.white,
                            ],
                            speed: Duration(seconds: 1),
                            textDirection: TextDirection.ltr,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    "Für Unternehmen",
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'BalooTammaRegular',
                      color: Colors.white54,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
