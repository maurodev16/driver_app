import 'package:flutter/material.dart';

import 'resumeNextBackBtn.dart';

Widget resumeForm() {
  return Form(
    child: Container(
      padding: EdgeInsets.only(top: 20, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Resume"),
            ],
          ),
          SizedBox(height: 10.0),
          Text("Image"),
          SizedBox(height: 25.0),
          Text("First name: Mauro Sergio"),
          SizedBox(height: 10.0),
          Text("Last name: Rodrigues da Silva"),
          SizedBox(height: 10.0),
          Text("Email: Mauro@gmail.com "),
          SizedBox(height: 10.0),
          Text("PLZ: 124567"),
          SizedBox(height: 10.0),
          Text("Ort: Saocisco"),
          SizedBox(height: 10.0),
          Text("City: Somw"),
          SizedBox(height: 10.0),
          Text("House Num: 10"),
          SizedBox(height: 10.0),
          Text("Phone: 018455452"),
          SizedBox(height: 10.0),
          Text("Cel: 102212222"),
          SizedBox(height: 10.0),
          Text("Identifications Num: 78949198189"),
          SizedBox(height: 10.0),
          Text("City: Somw"),
          Container(
            child: Row(
              children: [
                Checkbox(value: true, onChanged: null),
                Text("Eu aceito todos os Termos")
              ],
            ),
          ),
          resumeNextBackBtn(),
        ],
      ),
    ),
  );
}
