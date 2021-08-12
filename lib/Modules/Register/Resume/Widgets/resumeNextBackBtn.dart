import 'package:driver_app/Routers/appRouters.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget resumeNextBackBtn() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () {
            Get.back();
          },
          // icon: Icon(Icons.arrow_back_ios_rounded),
          child: Text('Back'),
        ),
        ElevatedButton(
          child: Text('Confirm'),
          onPressed: () {
            Get.offNamed(AppRoutes.STATUSPAGE);
            Get.defaultDialog(
              title: "Obrigado",
              middleText:
                  "Seus dados foram enviados para analise, voce recebera um email de confirmacao. Voce tambem podera acompanhar o status diretamente no app",
              backgroundColor: Colors.green,
              titleStyle: TextStyle(color: Colors.white),
              middleTextStyle: TextStyle(color: Colors.white),
              confirm: ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("OK"),
              ),
            );

            //Loading bar
            //Mostrar as info do motorista para ele confirmar
            //Loading bar
            //ENVIAR UM EMAIL PARA ELE INFORMANDO DO PROCESSO DE APROVACAO
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
