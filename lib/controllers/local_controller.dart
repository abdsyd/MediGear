import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LocaleController extends GetxController {
  final _getStorage = GetStorage();

  late Locale _initLocale;
  Locale get initialLang => _initLocale;

  LocaleController() {
    loadInitLocale();
  }

  void loadInitLocale() {
    _initLocale = Locale(_getStorage.read("lang") ?? Get.deviceLocale!.languageCode);
  }

  void updateLocale(String langCode) {
    _getStorage.write("lang", langCode);
    Get.updateLocale(Locale(langCode));
    update();
  }

  // just to get a new string when language changes
  String getCurrentLanguageLabel() {
    final currentLang = _getStorage.read("lang");
    if (currentLang == "ar") {
      return "العربية";
    } else if (currentLang == "en") {
      return "English";
    } else {
      return Get.deviceLocale!.languageCode; // if nothing is stored in local storage yet
    }

  }
}
