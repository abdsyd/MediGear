import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hunter/controllers/local_controller.dart';
import 'package:hunter/controllers/theme_controller.dart';
import 'package:hunter/locale.dart';
import 'package:hunter/routes.dart';
import 'package:hunter/test.dart';
import 'package:hunter/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    LocaleController localeController = LocaleController();
    ThemeController themeController = Get.put(ThemeController());
    return GetMaterialApp(
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context)
            .copyWith(textScaleFactor: 1, devicePixelRatio: 1),
        child: child!,
      ),
      debugShowCheckedModeBanner: false,
      translations: MyTranslation(),
      locale: localeController.initialLang,
      theme: AppTheme.myLightMode,
      darkTheme: AppTheme.myDarkMode,
      themeMode: themeController.getThemeMode(),
      getPages: routes,
    );
  }
}
