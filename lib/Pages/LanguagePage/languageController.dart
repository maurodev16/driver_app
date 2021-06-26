import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'languageStorage.dart';
import 'translationsService.dart';

class LanguageController extends GetxController {
  var _selectedLang = TranslationsService.langs.first.obs;
  String get getSelectedLang => _selectedLang.value;
  set setselectedLang(value) {
    _selectedLang.value = value;
  }

  @override
  void onInit() async {
    super.onInit();
    LanguageStorage languageStorage = LanguageStorage();
    _selectedLang.value = await languageStorage.readLanguageFromDisk == null
        ? _selectedLang.value
        : await languageStorage.readLanguageFromDisk;
    changeLocale(_selectedLang.value);
  }

  // Gets locale from language, and updates the locale
  void changeLocale(String lang) async {
    var locale = _getLocaleFromLanguage(lang);
    Get.updateLocale(locale);
  }

  // Finds language in `langs` list and returns it as Locale
  Locale _getLocaleFromLanguage(String lang) {
    LanguageStorage languageStorage = LanguageStorage();
    for (int i = 0; i < TranslationsService.langs.length; i++) {
      languageStorage.writeLanguageToDisk(lang);
      if (lang == TranslationsService.langs[i])
        return TranslationsService.locales[i];
      update();
    }
    return Get.locale;
  }
}
