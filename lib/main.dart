import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hunter/locale.dart';
import 'package:hunter/routes.dart';
import 'package:hunter/test.dart';
import 'package:hunter/themes.dart';
import 'package:hunter/views/home_view.dart';
import 'package:hunter/views/register_otp.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context)
            .copyWith(textScaleFactor: 1, devicePixelRatio: 1),
        child: child!,
      ),
      debugShowCheckedModeBanner: false,
      translations: MyTranslation(),
      theme: AppTheme.myLightMode,
      darkTheme: AppTheme.myDarkMode,
      getPages: routes,

    );
  }
}
