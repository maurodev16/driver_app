import 'package:driver_app/Utils/driverPreference.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NumbersWidget extends StatelessWidget {
  const NumbersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final driverModel = DriverPreferences.myDriver;
    return Card(
      margin: EdgeInsets.all(14.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildRatings(driverModel.ratings, 'Bewertungen', Colors.blue),
          buildPrice(driverModel.startPrice, 'Anfangspreis', Colors.blue),
          //buildButton(driverModel.doHelp.),
        ],
      ),
    );
  }

  buildPrice(double value, String text, Color color) => MaterialButton(
        onPressed: () {},
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(children: [
              Icon(
                CupertinoIcons.money_euro_circle_fill,
                color: Colors.redAccent,
                size: 15.0,
              ),
              SizedBox(width: 3),
              Text(
                '${value.toString()}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13.0,
                  color: color,
                ),
              ),
            ]),
            SizedBox(height: 2),
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 10.0,
                color: color,
              ),
            ),
          ],
        ),
      );
  buildRatings(double value, String text, Color color) => MaterialButton(
        onPressed: () {},
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(children: [
              Icon(
                CupertinoIcons.star_circle_fill,
                color: Colors.redAccent,
                size: 15.0,
              ),
              SizedBox(width: 3),
              Text(
                '${value.toString()}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13.0,
                  color: color,
                ),
              ),
            ]),
            SizedBox(height: 2),
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 10.0,
                color: color,
              ),
            ),
          ],
        ),
      );
}
