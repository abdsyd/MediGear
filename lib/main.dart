import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hunter/routes.dart';
import 'package:hunter/themes.dart';


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
      theme: AppTheme.englishTheme,
      getPages: routes,

    );
  }
}
