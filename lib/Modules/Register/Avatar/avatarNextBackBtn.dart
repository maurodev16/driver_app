import 'package:driver_app/Routers/appRouters.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget avatarNextBackBtn() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          child: Text('Back'),
          onPressed: () {
            Get.back();
          },
          // icon: Icon(Icons.arrow_back_ios_rounded),
        ),
        ElevatedButton(
          child: Text('Resume'),
          onPressed: () {
            Get.snackbar("Aguarde!", "Processando..",
                duration: Duration(seconds: 3));
            Future.delayed(Duration(seconds: 3), () {
              Get.toNamed(AppRoutes.RESUMEPAGE);
            });

            //Loading bar
            //Mostrar as info do motorista para ele confirmar
            //Levar ela para tela de Status
            //enviar as informacoes dele por email e informa-lo que esta em prcesso de analize
            // ele podera confirmar o status online ou quando ele abrir o app
            //ele podera entrar em contato por email
          },
        ),
      ],
    ),
  );
}
