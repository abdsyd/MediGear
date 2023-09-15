import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hunter/constants/k.dart';
import 'package:hunter/constants/routes_name.dart';
import 'package:hunter/controllers/auth/login_controller.dart';
import 'package:hunter/widgets/auth_button.dart';
import 'package:hunter/widgets/auth_field.dart';
import 'package:hunter/widgets/auth_suggestion.dart';
import 'package:hunter/widgets/auth_title.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController lC = Get.put(LoginController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: const BackButton(
          style: ButtonStyle(iconSize: MaterialStatePropertyAll(18)),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/MediGear2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              AuthTitle(
                title: 'Login'.tr,
                subTitle: 'Login to your account'.tr,
              ),
              const SizedBox(
                height: 15,
              ),
              Form(
                key: lC.loginFormKey,
                child: Column(
                  children: [
                    AuthField(
                      label: 'email'.tr,
                      textController: lC.email,
                      keyboardType: TextInputType.emailAddress,
                      icon: Icons.mail_outline,
                      validator: (val) {
                        return validateInput(lC.email.text, 6, 100, 'email');
                      },
                      onChanged: (val) {
                        if (lC.buttonPressed) {
                          lC.loginFormKey.currentState!.validate();
                        }
                      },
                    ),
                    GetBuilder<LoginController>(
                      builder: (controller) => AuthField(
                        label: 'password'.tr,
                        obscureText: !controller.passwordVisible,
                        icon: controller.passwordVisible ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
                        onIconPressed: () {
                          controller.togglePasswordVisibility(!controller.passwordVisible);
                        },
                        textController: controller.password,
                        keyboardType: TextInputType.text,
                        validator: (val) {
                          return validateInput(controller.password.text, 8, 100, 'password');
                        },
                        onChanged: (val) {
                          if (controller.buttonPressed) {
                            controller.loginFormKey.currentState!.validate();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: () {
                    Get.toNamed(AppRoute.forgotPassword1);
                  },
                  child: Text(
                    'Forgot password'.tr,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.grey.shade700,
                          decoration: TextDecoration.underline,
                        ),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              GetBuilder<LoginController>(
                builder: (controller) => AuthButton(
                  child: controller.isLoading
                      ? LoadingAnimationWidget.prograssiveDots(color: Colors.white, size: 40)
                      : Text(
                          'Sign in'.tr,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                  onPressed: () {
                    controller.login();
                    hideKeyboard(context);
                  },
                ),
              ),
              AuthSuggestion(
                  question: 'don\'t have an account?'.tr,
                  suggestion: 'Sign up'.tr,
                  onTap: () {
                    Get.toNamed(AppRoute.register);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
