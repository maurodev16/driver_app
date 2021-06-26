import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rider_app/Pages/LanguagePage/languageController.dart';
import 'package:rider_app/Pages/LanguagePage/translationsService.dart';

import 'languageStorage.dart';

class LangPage extends StatefulWidget {
  @override
  _LangPageState createState() => _LangPageState();
}

class _LangPageState extends State<LangPage> {
  final LanguageController _languageController = Get.put(LanguageController());
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.maxFinite,
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Obx(
                      () => DropdownButton(
                        isExpanded: true,
                        hint: Text("Languages"),
                        icon: Icon(Icons.language),
                        isDense: true,
                        value: _languageController.getSelectedLang,
                        items: TranslationsService.langs.map((String lang) {
                          return DropdownMenuItem(
                            value: lang,
                            child: Text(lang),
                            onTap: () {
                              LanguageStorage languageStorage =
                                  LanguageStorage();
                              print(languageStorage.readLanguageFromDisk);
                            },
                          );
                        }).toList(),
                        onChanged: (String value) {
                          _languageController.setselectedLang = value;
                          _languageController.changeLocale(value);
                          Get.back();
                        },
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
