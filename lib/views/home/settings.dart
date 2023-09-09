import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hunter/constants/colors.dart';
import 'package:hunter/controllers/local_controller.dart';
import 'package:hunter/controllers/theme_controller.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController localeController = LocaleController();

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 12,),
          children: [
            GetBuilder<ThemeController>(builder: (controller) {
              return ListTile(
              shape: RoundedRectangleBorder(
              side:  const BorderSide(color: AppColors.myPrimary,),
    borderRadius: BorderRadius.circular(5),
    ),
                title: Text(
                  'Dark Mode',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                trailing: Switch(
                  value: Get.isDarkMode,
                  onChanged: (value) {
                    controller.updateTheme();
                  },
                ),
              );
            }),
            ListTile(
            shape: RoundedRectangleBorder(
            side:  const BorderSide(color: AppColors.myPrimary,),
            borderRadius: BorderRadius.circular(5),
            ),
              title: Text(
                'Language'.tr,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              trailing: DropdownButton(
                hint: Text(
                  localeController.getCurrentLanguageLabel(),
                ),
                onChanged: (newValue) {
                  localeController.updateLocale(newValue!);
                },
                items: [
                  DropdownMenuItem(
                    value: "ar",
                    child: Text("Arabic ".tr),
                  ),
                  DropdownMenuItem(
                    value: "en",
                    child: Text("English ".tr),
                  ),
                ],
              ),
            ),
            ListTile(
              shape: RoundedRectangleBorder(
                side:  const BorderSide(color: AppColors.myPrimary,),
                borderRadius: BorderRadius.circular(5),
              ),
              title: Text(
                'Terms and Conditions'.tr,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              onTap: () {
                // Navigate to the Terms and Conditions screen
              },
            ),
            ListTile(
    shape: RoundedRectangleBorder(
    side:  const BorderSide(color: AppColors.myPrimary,),
    borderRadius: BorderRadius.circular(5),
    ),
              title: Text(
                'Privacy Policy'.tr,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              onTap: () {
                // Navigate to the Privacy Policy screen
              },
            ),
          ],
        ),
      ),
    );
  }
}
