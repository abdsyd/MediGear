import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hunter/constants/colors.dart';
import 'package:hunter/controllers/local_controller.dart';
import 'package:hunter/controllers/theme_controller.dart';
import 'package:hunter/widgets/profile_button.dart';

class ProfileSettings extends StatelessWidget {
  const ProfileSettings({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController localeController = Get.put(LocaleController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Settings'),
        leading: const BackButton(
          style: ButtonStyle(iconSize: MaterialStatePropertyAll(18)),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
          ),
          children: [
            GetBuilder<ThemeController>(builder: (controller) {
              return ProfileButton(
                title: 'Dark Mode'.tr,
                trailing: Switch(
                  value: Get.isDarkMode,
                  onChanged: (value) {
                    controller.updateTheme();
                  },
                ),
              );
            }),
            ProfileButton(
              title: 'Language'.tr,
              trailing: DropdownButton(
                elevation: 0,
                iconEnabledColor: AppColors.myPrimary,
                hint: Text(
                  localeController.getCurrentLanguageLabel(),
                  style: Theme.of(context).textTheme.bodyMedium!,
                ),
                onChanged: (newValue) {
                  localeController.updateLocale(newValue!);
                },
                items: [
                  DropdownMenuItem(
                    value: "ar",
                    child: Text(
                      "Arabic ".tr,
                    ),
                  ),
                  DropdownMenuItem(
                    value: "en",
                    child: Text(
                      "English ".tr,
                    ),
                  ),
                ],
              ),
            ),
            ProfileButton(
              title: 'Terms and Conditions'.tr,
              onPressed: () {
                // Navigate to the Terms and Conditions screen
              },
            ),
            ProfileButton(
              title: 'Privacy Policy'.tr,
              onPressed: () {
                // Navigate to the Privacy Policy screen
              },
            ),
          ],
        ),
      ),
    );
  }
}
