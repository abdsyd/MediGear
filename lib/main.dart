import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hunter/constants/routes_name.dart';
import 'package:hunter/controllers/local_controller.dart';
import 'package:hunter/controllers/theme_controller.dart';
import 'package:hunter/locale.dart';
import 'package:hunter/routes.dart';
import 'package:hunter/themes.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(LocaleController());
    ThemeController themeController = Get.put(ThemeController());
    return GetBuilder<LocaleController>(
      builder: (localeController) {
        return GetMaterialApp(
          builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaleFactor: 1, devicePixelRatio: 1),
            child: child!,
          ),
          debugShowCheckedModeBanner: false,
          translations: MyTranslation(),
          locale: localeController.initialLang,
          theme: Get.locale!.languageCode == 'en' ? AppTheme.myEnglishLightMode : AppTheme.myArabicLightMode,
          darkTheme: Get.locale!.languageCode == 'en' ? AppTheme.myEnglishDarkMode : AppTheme.myArabicDarkMode,
          themeMode: themeController.getThemeMode(),
          initialRoute: AppRoute.onboarding ,
          getPages: routes,
        );
      }
    );
  }
}
