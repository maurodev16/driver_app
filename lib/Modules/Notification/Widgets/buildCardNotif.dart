import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget buildCardNotif() {
  return Card(
    color: Colors.white,
    elevation: 5,
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
          height: Get.height / 3.9,
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
                      "Cliente: Fulano de tal",
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
                "Sao Paulo",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    " Preco por hora:",
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
                      " Aguardando..",
                      style: TextStyle(fontSize: 15, color: Colors.yellow),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 14),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(CupertinoIcons.calendar,
                        color: Colors.white, size: 13),
                    Text(
                      " 03 Sept 2021, ",
                      style: TextStyle(fontSize: 13, color: Colors.blueGrey),
                    ),
                    Icon(CupertinoIcons.time, color: Colors.white, size: 13),
                    Text(
                      "14:36",
                      style: TextStyle(fontSize: 13, color: Colors.blueGrey),
                    )
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
            "O cliente esta de MUDANCA",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        SizedBox(height: 10),
        Text(
          "O cliente precisa de Ajuda ?: SIM",
          style: TextStyle(fontSize: 15, color: Colors.black),
        ),
        Text(
          "Andares: 5°",
          style: TextStyle(fontSize: 15, color: Colors.black),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Carregar: Mesa, Fogao, Geladeira ",
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12.0, top: 12),
          child: Row(children: [
            Icon(Icons.gps_fixed),
            Text(
              " Endereco de busca",
              style: TextStyle(fontSize: 13, color: Colors.blueGrey),
            ),
            Text(
              "  Campinas, Rua tal, numero 3, Cep 12356",
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
                    Text(
                      "   Abrir no Mapa?",
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
                " Destino",
                style: TextStyle(fontSize: 13, color: Colors.blueGrey),
              ),
              Text(
                "   Sao Paulo, Rua tal, numero 3, Cep 12356",
                style: TextStyle(fontSize: 15, color: Colors.grey[800]),
              )
            ],
          ),
        ),
        SizedBox(height: 5),
        Card(
          child: Column(
            children: [
              Text(
                "Agendamento: 16 sept 21 um 13:00",
                style: TextStyle(fontSize: 22, color: Colors.red),
              ),
              Text(
                "Agendamento: Hoje",
                style: TextStyle(fontSize: 22, color: Colors.red),
              ),
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
                child: Text("Aceitar"),
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
                child: Text("Recusar"),
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
