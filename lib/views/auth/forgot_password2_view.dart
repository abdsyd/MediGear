import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hunter/widgets/auth_button.dart';
import 'package:hunter/widgets/auth_field.dart';
import 'package:hunter/widgets/auth_title.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../controllers/auth/forgot_password_controller.dart';

class ForgotPass2View extends StatelessWidget {
  const ForgotPass2View({super.key});

  @override
  Widget build(BuildContext context) {
    ForgotPassController fPC = Get.find();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(

        leading: const BackButton(
          style: ButtonStyle(iconSize: MaterialStatePropertyAll(18)),
        ),
      ),
      body: Center(
        child: Form(
          key: fPC.secondFormKey,
          child: Column(
            children: [
              AuthTitle(
                title: 'Reset Password'.tr,
                subTitle: 'Enter your new password '.tr,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: GetBuilder<ForgotPassController>(
                  builder: (controller) => AuthField(
                    label: 'password'.tr,
                    autoFocus: true,
                    obscureText: !controller.passwordVisible,
                    icon: controller.passwordVisible
                        ? CupertinoIcons.eye_slash
                        : CupertinoIcons.eye,
                    onIconPressed: () {
                      controller.togglePasswordVisibility(
                          !controller.passwordVisible);
                    },
                    textController: controller.newPassword,
                    keyboardType: TextInputType.text,
                    validator: (val) {
                      return validateInput(
                          controller.newPassword.text, 8, 100, 'password');
                    },
                    onChanged: (val) {
                      if (controller.button2Pressed) {
                        controller.secondFormKey.currentState!.validate();
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: GetBuilder<ForgotPassController>(
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
                    textController: controller.reNewPassword,
                    keyboardType: TextInputType.text,
                    validator: (val) {
                      return validateInput(
                          controller.reNewPassword.text, 8, 100, 'rePassword');
                    },
                    onChanged: (val) {
                      if (controller.button2Pressed) {
                        controller.secondFormKey.currentState!.validate();
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: GetBuilder<ForgotPassController>(
                  builder: (controller) => AuthButton(
                    child: controller.isLoading2
                        ? LoadingAnimationWidget.prograssiveDots(
                            color: Colors.white, size: 40)
                        : Text(
                            'Reset Password'.tr,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                    onPressed: () {
                      controller.resetPass(controller.newPassword.text,controller.reNewPassword.text);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
