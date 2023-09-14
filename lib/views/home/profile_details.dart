import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hunter/constants/k.dart';
import 'package:hunter/controllers/home/bnb_tabs/profile_controller.dart';
import 'package:hunter/controllers/home/home_controller.dart';
import 'package:hunter/widgets/auth_button.dart';
import 'package:hunter/widgets/auth_field.dart';
import 'package:hunter/widgets/snake_bar.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController pC = Get.find();
    HomeController hC = Get.find();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Details'),
        leading: const BackButton(
          style: ButtonStyle(iconSize: MaterialStatePropertyAll(18)),
        ),
      ),
      body: Form(
        key: pC.detailsFormKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          children: [
            GestureDetector(
              onTap: () {
                Get.showSnackbar(mySnackBar(messageText: "Cant Change email or role".tr));
              },
              child: AuthField(
                enabled: false,
                hint: hC.currentUser != null ? hC.currentUser!.email : 'email'.tr,
                hintStyle: Theme.of(context).textTheme.displayMedium!.copyWith(color: Colors.grey, fontSize: 13),
                icon: Icons.mail_outline,
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.showSnackbar(mySnackBar(messageText: "Cant Change email or role".tr));
              },
              child: AuthField(
                enabled: false,
                hint: hC.currentUser != null ? hC.currentUser!.role : 'role'.tr,
                hintStyle: Theme.of(context).textTheme.displayMedium!.copyWith(color: Colors.grey, fontSize: 13),
                icon: CupertinoIcons.person_2,
              ),
            ),
            AuthField(
              textController: pC.name,
              keyboardType: TextInputType.name,
              icon: Icons.person_outlined,
              validator: (val) {
                return validateInput(pC.name.text, 8, 100, 'name');
              },
              onChanged: (val) {
                if (pC.editProfileButtonPressed) {
                  pC.detailsFormKey.currentState!.validate();
                }
              },
            ),
            AuthField(
              textController: pC.phone,
              keyboardType: TextInputType.phone,
              icon: Icons.phone_outlined,
              validator: (val) {
                return validateInput(pC.phone.text, 8, 100, 'phone');
              },
              onChanged: (val) {
                if (pC.editProfileButtonPressed) {
                  pC.detailsFormKey.currentState!.validate();
                }
              },
            ),
            GetBuilder<ProfileController>(builder: (controller) {
              return AuthButton(
                onPressed: () {
                  controller.saveChanges();
                },
                child:  Text(
                        'Save Changes'.tr,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
              );
            }),
            const SizedBox(
              height: 50,
            ),
            GetBuilder<ProfileController>(
              builder: (controller) => const AuthField(
                enabled: false,
                hint: '*******',
                icon: CupertinoIcons.eye,
              ),
            ),
             AuthButton(
                onPressed: () {
                  Get.bottomSheet(
                    Container(
                      padding: const EdgeInsets.all(16),
                      color: Colors.white,
                      child: Form(
                        key: pC.passwordsFormKey,
                        child: GetBuilder<ProfileController>(
                          builder: (controller) {
                            return ListView(
                              children: [
                                AuthField(
                                  label: 'current password'.tr,
                                  obscureText: !controller.currentPasswordVisible,
                                  icon: controller.currentPasswordVisible ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
                                  onIconPressed: () {
                                    controller.toggleCurrentPasswordVisibility(!controller.currentPasswordVisible);
                                  },
                                  textController: controller.password,
                                  keyboardType: TextInputType.text,
                                  validator: (val) {
                                    return validateInput(controller.password.text, 8, 100, 'password');
                                  },
                                  onChanged: (val) {
                                    if (controller.editPasswordButtonPressed) {
                                      controller.detailsFormKey.currentState!.validate();
                                    }
                                  },
                                ),
                                AuthField(
                                  label: 'new password'.tr,
                                  obscureText: !controller.newPasswordVisible,
                                  icon: controller.newPasswordVisible ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
                                  onIconPressed: () {
                                    controller.toggleNewPasswordVisibility(!controller.newPasswordVisible);
                                  },
                                  textController: controller.rePassword,
                                  keyboardType: TextInputType.text,
                                  validator: (val) {
                                    return validateInput(controller.rePassword.text, 8, 100, 'password');
                                  },
                                  onChanged: (val) {
                                    if (controller.editPasswordButtonPressed) {
                                      controller.detailsFormKey.currentState!.validate();
                                    }
                                  },
                                ),
                                const SizedBox(height: 16),
                                AuthButton(
                                  onPressed: () {
                                    controller.changePassword(controller.password.text, controller.rePassword.text);
                                    hideKeyboard(context);
                                  },
                                  child: const Text('Submit'),
                                ),
                              ],
                            );
                          }
                        ),
                      ),
                    ),
                  );
                },
                child: Text(
                        'Change Password'.tr,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
              ),

          ],
        ),
      ),
    );
  }
}
