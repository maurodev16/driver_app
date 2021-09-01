import 'package:driver_app/Utils/driverPreference.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'numbersWidgtes.dart';

class InfosWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return buildInfos();
  }

  buildInfos() {
    final driverModel = DriverPreferences.myDriver;
    return Column(
      children: [
        // Nome do Motorista
        Text(
          '${driverModel.firstname} ${driverModel.lastname}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15.0,
          ),
        ),
        SizedBox(height: 8),
        Text(
          driverModel.email,
          style: TextStyle(
            fontSize: 12.0,
            color: Colors.grey.shade600,
          ),
        ),
        SizedBox(height: 8),
        // Reputacao e Preco
        NumbersWidget(),
        const SizedBox(height: 4),
        // Endereco
        Card(
          margin: EdgeInsets.only(top: 5.0, left: 14.0, right: 14.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                (CupertinoIcons.placemark),
                color: Colors.redAccent,
                size: 15.0,
              ),
              SizedBox(width: 8),
              Text(
                driverModel.city,
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.grey.shade600,
                ),
              ),
              Text(', '),
              Text(
                driverModel.postcode,
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.grey.shade600,
                ),
              ),
              Text(' '),
              Text(
                driverModel.ort,
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.grey.shade600,
                ),
              ),
              SizedBox(width: 8),
            ],
          ),
        ),
        const SizedBox(height: 4),
        //Idiomas
        Card(
          margin: EdgeInsets.only(top: 5.0, left: 14.0, right: 14.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                (Icons.language_outlined),
                color: Colors.redAccent,
                size: 15.0,
              ),
              SizedBox(width: 8),
              Text('Sprache'),
              SizedBox(width: 2),
              Text(
                driverModel.language,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(width: 2),
              Text('und'),
              SizedBox(width: 2),
              Text(
                'Portuguisech',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
        //Informacoes do Veiculo
        Card(
          margin: EdgeInsets.only(top: 5.0, left: 14.0, right: 14.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    (CupertinoIcons.car),
                    color: Colors.redAccent,
                    size: 15.0,
                  ),
                  SizedBox(width: 8),
                  Text(
                    driverModel.carbrand,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13.0,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  SizedBox(width: 8),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    (CupertinoIcons.xmark_circle),
                    color: Colors.redAccent,
                    size: 15.0,
                  ),
                  SizedBox(width: 8),
                  Text(
                    driverModel.carname,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  SizedBox(width: 8),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    (CupertinoIcons.placemark),
                    color: Colors.redAccent,
                    size: 15.0,
                  ),
                  SizedBox(width: 8),
                  Text(
                    driverModel.licensePlate,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  SizedBox(width: 8),
                ],
              ),
            ],
          ),
        ),
        Text(
          driverModel.doHelp.toString(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15.0,
            color: Colors.grey.shade600,
          ),
        ),
        SizedBox(height: 8),
        Text(
          driverModel.trips.toString(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15.0,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }
}
