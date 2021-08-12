import 'package:flutter/material.dart';

import 'addressNextBackBtn.dart';

Widget addressForm() {
  return Form(
    child: Container(
      padding: EdgeInsets.only(top: 20, left: 10, right: 10),
      child: Column(
        children: [
          Text("Address"),

          SizedBox(height: 10.0),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            autofocus: false,
            decoration: InputDecoration(
              hintText: 'PLZ',
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
              suffixIcon: Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 20,
              ),
            ),
          ),
          SizedBox(height: 10.0),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            autofocus: false,
            decoration: InputDecoration(
              hintText: 'Ort',
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
              suffixIcon: Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 20,
              ),
            ),
          ),
          SizedBox(height: 10.0),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            autofocus: false,
            decoration: InputDecoration(
              hintText: 'City',
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
              suffixIcon: Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 20,
              ),
            ),
          ),
          // PLZ
          SizedBox(height: 10.0),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            autofocus: false,
            decoration: InputDecoration(
              hintText: 'Hause Number',
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
              suffixIcon: Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 20,
              ),
            ),
          ),
          SizedBox(height: 10.0),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            autofocus: false,
            decoration: InputDecoration(
              hintText: 'Phone',
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
              suffixIcon: Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 20,
              ),
            ),
          ),
          SizedBox(height: 10.0),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            autofocus: false,
            decoration: InputDecoration(
              hintText: 'Cel',
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
              suffixIcon: Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 20,
              ),
            ),
          ),

          addressNextBackBtn(),
        ],
      ),
    ),
  );
}
