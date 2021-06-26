import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProgressDialog extends StatelessWidget {
  final String message;

  ProgressDialog({this.message});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.lightBlueAccent,
      child: Container(
        margin: EdgeInsets.all(1.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: [
              GetPlatform.isAndroid
                  ? CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.white,
                      ),
                    )
                  : CupertinoActivityIndicator(),
              SizedBox(width: 20.0),
              Expanded(
                child: Text(
                  message,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10.0,
                    fontFamily: 'BalooTammaRegular',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
