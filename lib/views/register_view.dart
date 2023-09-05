import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hunter/constants/routes_name.dart';
import 'package:hunter/controllers/register_controller.dart';
import 'package:get/get.dart';
import 'package:hunter/widgets/auth_button.dart';
import 'package:hunter/widgets/auth_field.dart';
import 'package:hunter/widgets/auth_suggestion.dart';
import 'package:hunter/widgets/auth_title.dart';
import 'package:hunter/widgets/auth_toggle_button.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    RegisterController rC = Get.put(RegisterController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const BackButton(
          style: ButtonStyle(iconSize: MaterialStatePropertyAll(18)),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              AuthTitle(
                  title: 'Sign up'.tr, subTitle: 'Sign up for free with us'.tr),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Form(
                  key: rC.registerFormKey,
                  child: Column(
                    children: [
                      AuthField(
                        label: 'name'.tr,
                        textController: rC.name,
                        keyboardType: TextInputType.name,
                        icon: Icons.person_outlined,
                        validator: (val) {
                          return validateInput(rC.name.text, 8, 100, 'name');
                        },
                        onChanged: (val) {
                          if (rC.buttonPressed) {
                            rC.registerFormKey.currentState!.validate();
                          }
                        },
                      ),
                      AuthField(
                        label: 'email'.tr,
                        textController: rC.email,
                        keyboardType: TextInputType.emailAddress,
                        icon: Icons.mail_outline,
                        validator: (val) {
                          return validateInput(rC.email.text, 8, 100, 'email');
                        },
                        onChanged: (val) {
                          if (rC.buttonPressed) {
                            rC.registerFormKey.currentState!.validate();
                          }
                        },
                      ),
                      GetBuilder<RegisterController>(
                        builder: (controller) => AuthField(
                          label: 'password'.tr,
                          obscureText: !controller.passwordVisible,
                          icon: controller.passwordVisible
                              ? CupertinoIcons.eye_slash
                              : CupertinoIcons.eye,
                          onIconPressed: () {
                            controller.togglePasswordVisibility(
                                !controller.passwordVisible);
                          },
                          textController: controller.password,
                          keyboardType: TextInputType.text,
                          validator: (val) {
                            return validateInput(
                                controller.password.text, 8, 100, 'password');
                          },
                          onChanged: (val) {
                            if (controller.buttonPressed) {
                              controller.registerFormKey.currentState!
                                  .validate();
                            }
                          },
                        ),
                      ),
                      GetBuilder<RegisterController>(
                        builder: (controller) => AuthField(
                          label: 'rePassword'.tr,
                          obscureText: !controller.rePasswordVisible,
                          icon: controller.rePasswordVisible
                              ? CupertinoIcons.eye_slash
                              : CupertinoIcons.eye,
                          onIconPressed: () {
                            controller.toggleRePasswordVisibility(
                                !controller.rePasswordVisible);
                          },
                          textController: controller.rePassword,
                          keyboardType: TextInputType.text,
                          validator: (val) {
                            return validateInput(controller.rePassword.text, 8,
                                100, 'rePassword');
                          },
                          onChanged: (val) {
                            if (controller.buttonPressed) {
                              controller.registerFormKey.currentState!
                                  .validate();
                            }
                          },
                        ),
                      ),
                      AuthField(
                        label: 'phone'.tr,
                        textController: rC.phone,
                        keyboardType: TextInputType.phone,
                        icon: Icons.phone_outlined,
                        validator: (val) {
                          return validateInput(rC.phone.text, 8, 100, 'phone');
                        },
                        onChanged: (val) {
                          if (rC.buttonPressed) {
                            rC.registerFormKey.currentState!.validate();
                          }
                        },
                      ),
                      GetBuilder<RegisterController>(
                          builder: (controller) => AuthToggleButton(
                                onSelectionChanged: (int newIndex) {
                                  controller.selectionRoleIndex = newIndex;
                                },
                              )),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: GetBuilder<RegisterController>(
                  builder: (controller) => AuthButton(
                    child: controller.isLoading
                        ? LoadingAnimationWidget.prograssiveDots(
                            color: Colors.white, size: 40)
                        : Text(
                            'Sign up'.tr,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                    onPressed: () {
                      controller.register(
                        controller.email.text,
                        controller.password.text,
                        controller.name.text,
                        controller.phone.text,
                        controller.selectionRoleIndex.toString(),
                      );
                    },
                  ),
                ),
              ),
              AuthSuggestion(
                  question: 'already have an account?'.tr,
                  suggestion: 'Sign in'.tr,
                  onTap: () {
                    Get.offNamed(
                      AppRoute.login,
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
