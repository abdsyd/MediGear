import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hunter/constants/routes_name.dart';
import 'package:hunter/controllers/local_controller.dart';
import 'package:hunter/controllers/theme_controller.dart';
import 'package:hunter/locale.dart';
import 'package:hunter/routes.dart';
import 'package:hunter/themes.dart';

void main() async{
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.put(ThemeController());
    return GetBuilder<LocaleController>(
      init: LocaleController(),
      builder: (con) => GetMaterialApp(
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1, devicePixelRatio: 1),
          child: child!,
        ),
        debugShowCheckedModeBanner: false,
        translations: MyTranslation(),
        locale: con.initialLang,
        theme: GetStorage().read('lang') == 'ar' ? AppTheme.myArabicLightMode : AppTheme.myEnglishLightMode,
        darkTheme: GetStorage().read('lang') == 'ar' ? AppTheme.myArabicDarkMode : AppTheme.myEnglishDarkMode,
        themeMode: themeController.getThemeMode(),
        initialRoute: AppRoute.onboarding,
        getPages: routes,
      ),
    );
  }
}
