import 'package:get_storage/get_storage.dart';

class LanguageStorage {
  ///Write
  void writeLanguageToDisk(String language) async {
    await GetStorage().write('lang', language);
  }

  ///Read
  Future<String> get readLanguageFromDisk async {
    return await GetStorage().read('lang');
  }
}
