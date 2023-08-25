import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

/// this is not a getX controller, we arent updating UI manually from here so there is no need to make it a controller
class LocaleController {
  final _getStorage = GetStorage();

  late Locale _initLocale;
  Locale get initialLang => _initLocale;

  // a constructor , this is called whenever we create an object from this class
  LocaleController() {
    loadInitLocale();
  }

  void loadInitLocale() {
    _initLocale = Locale(_getStorage.read("lang") ?? Get.deviceLocale!.languageCode);
    // here we set the initial language of the app based on a lang code stored in local storage
    // if its null (first launch of the app), we simply get the lang code of the device language
  }

  void updateLocale(String langCode) {
    _getStorage.write("lang", langCode);
    Get.updateLocale(Locale(langCode));
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
