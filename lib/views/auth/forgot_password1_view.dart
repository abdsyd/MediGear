import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hunter/constants/k.dart';
import 'package:hunter/constants/routes_name.dart';
import 'package:hunter/controllers/auth/forgot_password_controller.dart';
import 'package:hunter/widgets/auth_button.dart';
import 'package:hunter/widgets/auth_field.dart';
import 'package:hunter/widgets/auth_suggestion.dart';
import 'package:hunter/widgets/auth_title.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ForgotPass1View extends StatelessWidget {
  const ForgotPass1View({super.key});

  @override
  Widget build(BuildContext context) {
    ForgotPassController fPC = Get.put(ForgotPassController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: const BackButton(
          style: ButtonStyle(iconSize: MaterialStatePropertyAll(18)),
        ),
      ),
      body: Center(
        child: Form(
          key: fPC.firstFormKey,
          child: Column(
            children: [
               AuthTitle(
                title: 'Forget Password'.tr,
                subTitle: 'Enter your email address'.tr,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: AuthField(
                  label: 'email'.tr,
                  autoFocus: true,
                  icon: Icons.mail_outline,
                  textController: fPC.email,
                  keyboardType: TextInputType.emailAddress,
                  validator: (val) {
                    return validateInput(fPC.email.text, 8, 100, 'email');
                  },
                  onChanged: (val) {
                    if (fPC.button1Pressed) {
                      fPC.firstFormKey.currentState!.validate();
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: GetBuilder<ForgotPassController>(
                  builder: (controller) => AuthButton(
                    child: controller.isLoading1
                        ? LoadingAnimationWidget.prograssiveDots(
                            color: Colors.white, size: 40)
                        : Text(
                            'Confirm'.tr,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                    onPressed: () {
                      controller.goToOtp();
                      hideKeyboard(context);
                    },
                  ),
                ),
              ),
              AuthSuggestion(
                  question: 'remembered password ? '.tr,
                  suggestion: ' sign in'.tr,
                  onTap: () {
                    Get.toNamed(AppRoute.login);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
