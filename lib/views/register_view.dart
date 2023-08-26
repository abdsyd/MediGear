import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hunter/constants/colors.dart';
import 'package:hunter/constants/routes_name.dart';
import 'package:hunter/controllers/register_controller.dart';
import 'package:get/get.dart';
import 'package:hunter/widgets/auth_button.dart';
import 'package:hunter/widgets/auth_field.dart';
import 'package:hunter/widgets/auth_suggestion.dart';
import 'package:hunter/widgets/auth_title.dart';

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
              const AuthTitle(
                  title: 'Sign up', subTitle: 'Sign up for free with us'),
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
                        label: 'name',
                        obscureText: false,
                        textController: rC.name,
                        keyboardType: TextInputType.name,
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
                        label: 'email',
                        obscureText: false,
                        textController: rC.email,
                        keyboardType: TextInputType.emailAddress,
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
                          label: 'password',
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
                          label: 'repassword',
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
                        label: 'phone',
                        obscureText: false,
                        textController: rC.phone,
                        keyboardType: TextInputType.phone,
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
                        builder: (controller) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ToggleButtons(
                            isSelected: controller.isSelected,
                            onPressed: (int newIndex) {
                              controller.toggleSelections(newIndex);
                            },
                            borderRadius: BorderRadius.circular(6.5),
                            borderWidth: 2.0,
                            textStyle: Theme.of(context).textTheme.bodyLarge,
                            fillColor: AppColors.myPrimary,
                            selectedColor: Colors.white,
                            children: const [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  children: [
                                    Icon(Icons.medical_services_outlined),
                                    Text('doctor'),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  children: [
                                    Icon(Icons.storefront),
                                    Text(
                                      'supplier',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: AuthButton(
                  text: 'Sign up',
                  onPressed: () {
                    rC.register();
                  },
                  color: AppColors.myPrimary,
                ),
              ),
              AuthSuggestion(
                  question: 'already have an account?',
                  suggestion: 'Sign in',
                  onTap: () {
                    Get.offNamed(AppRoute.login);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
