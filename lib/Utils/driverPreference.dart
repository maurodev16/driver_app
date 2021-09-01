import 'package:driver_app/Data/Models/driverModel.dart';

class DriverPreferences {
  static const myDriver = DriverModel(
    driverAvatarUrl:
        'https://http2.mlstatic.com/D_NQ_NP_725452-MLB40929665014_022020-O.jpg',
    firstname: 'Mauro Sergio',
    lastname: 'Rodrigues da Silva',
    email: 'mauro.silva.skype@gmail.com',
    language: 'Deutsch',
    postcode: '45145',
    ort: 'Frohnhausen',
    city: 'Essen',
    carname: 'MAN',
    carbrand: 'VW',
    licensePlate: 'FTG-2212',
    doHelp: true,
    startPrice: 25.00,
    trips: 122,
    ratings: 5.0,
    isDarkMode: false,
  );
}
