import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'avatarNextBackBtn.dart';

Widget avatarForm() {
  return Form(
    child: Container(
      padding: EdgeInsets.only(top: Get.height / 3.5, left: 10, right: 10),
      child: Column(
        children: [
          SizedBox(
            height: 115,
            width: 115,
            child: Stack(
              fit: StackFit.expand,
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.green,
                  child: CircleAvatar(
                    backgroundColor: Colors.yellowAccent,
                    radius: 60,
                    backgroundImage: NetworkImage(
                      "https://cdn.icon-icons.com/icons2/2643/PNG/512/male_man_boy_black_tone_people_person_avatar_icon_159356.png",
                    ),
                    //child: TextButton(onPressed: () {}, child: Text("bcb")),
                  ),
                ),
                Positioned(
                  right: -12,
                  bottom: 0,
                  child: SizedBox(
                    height: 46,
                    width: 46,
                    child: TextButton(
                      child: Icon(Icons.camera_alt_outlined),
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xFFF5F6F9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(color: Colors.white),
                        ),
                        padding: EdgeInsets.zero,
                      ),
                      onPressed: () {},
                    ),
                  ),
                )
              ],
            ),
          ),
          avatarNextBackBtn(),
        ],
      ),
    ),
  );
}
