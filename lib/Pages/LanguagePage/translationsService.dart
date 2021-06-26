import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rider_app/Services/Languages/de_DE.dart';
import 'package:rider_app/Services/Languages/en_GB.dart';
import 'package:rider_app/Services/Languages/es_ES.dart';
import 'package:rider_app/Services/Languages/fr_FR.dart';
import 'package:rider_app/Services/Languages/hr_HR.dart';
import 'package:rider_app/Services/Languages/pl_PL.dart';
import 'package:rider_app/Services/Languages/pt_BR.dart';
import 'package:rider_app/Services/Languages/tr_TR.dart';

class TranslationsService extends Translations {
  //keys and their translation
  //Translation are separated mapsin 'languages' file
  @override
  Map<String, Map<String, String>> get keys => {
        'de_DE': de_DE,
        'en_GB': en_GB,
        'pt_BR': pt_BR,
        'es_ES': es_ES,
        'pl_PL': pl_PL,
        'hr_HR': hr_HR,
        'fr_FR': fr_FR,
        'tr_TR': tr_TR,
      };

  // Default locale
  static const locale = Locale('de', 'DE');

  // fallback Locale saves the day when the locale gets in trouble
  static const fallBackLocale = Locale('de', 'DE');

  //suported Languages
  //Needs to be same order with locales
  static const langs = [
    'Deutsch',
    'English',
    'Português',
    'Spanish',
    'Polskie',
    'Croatian',
    'French',
    'Turkish',
  ];
  //SUported Locales
  //Needs to be same order with langs
  static const locales = [
    Locale('de', 'DE'),
    Locale('en', 'GB'),
    Locale('pt', 'BR'),
    Locale('es', 'ES'),
    Locale('pl', 'PL'),
    Locale('hr', 'HR'),
    Locale('fr', 'FR'),
    Locale('tr', 'TR'),
  ];
}
