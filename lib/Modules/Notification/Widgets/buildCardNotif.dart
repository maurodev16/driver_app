import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget buildCardNotif() {
  return Card(
    color: Colors.white,
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
      side: BorderSide(
        width: 1,
        color: Colors.black,
      ),
    ),
    child: Column(
      children: [
        Container(
          width: Get.width,
          height: Get.height / 4,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(
                width: 1,
                style: BorderStyle.solid,
                color: Colors.red,
              ),
            ),
            color: Colors.black,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Kundin(e): Luana Rodrigues da Silva",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      CupertinoIcons.star_fill,
                      color: Colors.amber,
                      size: 12,
                    ),
                    Text(
                      "5.0",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "Essen",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    " Price pro Stunde ohne Hilfe:",
                    style: TextStyle(fontSize: 15, color: Colors.blue[500]),
                  ),
                  Icon(CupertinoIcons.money_euro, color: Colors.white),
                  Text(
                    "25.00",
                    style: TextStyle(fontSize: 20, color: Colors.blueGrey[500]),
                  )
                ],
              ),
              Container(height: 1, width: Get.width, color: Colors.blueGrey),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Status:",
                      style: TextStyle(fontSize: 18, color: Colors.blue[500]),
                    ),
                    Text(
                      " Erwarte..",
                      style: TextStyle(fontSize: 15, color: Colors.yellow),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 10),
        Card(
          color: Colors.red,
          child: Text(
            "UMZUG",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        SizedBox(height: 10),
        Text(
          "Hilfe: JA",
          style: TextStyle(fontSize: 15, color: Colors.black),
        ),
        Text(
          "Etage: 5",
          style: TextStyle(fontSize: 15, color: Colors.black),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Zu ladende: Tisch, Bücherregal, Kühlschrank, Kleiderschrank, Herd, Schränke",
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12.0, top: 12),
          child: Row(children: [
            Icon(Icons.gps_fixed),
            Text(
              " Abholen",
              style: TextStyle(fontSize: 13, color: Colors.blueGrey),
            ),
            Text(
              "   Essen Sybel 45145",
              style: TextStyle(fontSize: 15, color: Colors.grey[800]),
            )
          ]),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12.0, top: 2),
          child: Row(
            children: [
              SizedBox(width: 11),
              Container(
                height: 50,
                width: 2,
                color: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Row(
                  children: [
                    Icon(CupertinoIcons.time),
                    Text(
                      " 30 min",
                      style: TextStyle(fontSize: 13, color: Colors.blueGrey),
                    ),
                    Text(
                      "   Auf Karte öffnen?",
                      style: TextStyle(fontSize: 15, color: Colors.grey[800]),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(CupertinoIcons.map),
                      color: Colors.blue,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12.0, top: 2),
          child: Row(
            children: [
              Icon(CupertinoIcons.location_solid),
              Text(
                " Ziel",
                style: TextStyle(fontSize: 13, color: Colors.blueGrey),
              ),
              Text(
                "   Essen Pollerbergstr 45145",
                style: TextStyle(fontSize: 15, color: Colors.grey[800]),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text("Annehmen"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                  textStyle: MaterialStateProperty.all(
                    TextStyle(fontSize: 20),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("Ablehnen"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.grey[800]),
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
