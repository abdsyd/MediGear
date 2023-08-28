import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hunter/constants/colors.dart';
import 'package:hunter/constants/routes_name.dart';
import 'package:hunter/controllers/forgot_password_controller.dart';
import 'package:hunter/widgets/auth_button.dart';
import 'package:hunter/widgets/auth_field.dart';
import 'package:hunter/widgets/auth_suggestion.dart';
import 'package:hunter/widgets/auth_title.dart';

class ForgotPass1View extends StatelessWidget {
  const ForgotPass1View({super.key});

  //to enter the email of the account to reset its password
  @override
  Widget build(BuildContext context) {
    ForgotPassController fPC = Get.put(ForgotPassController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const BackButton(
          style: ButtonStyle(iconSize: MaterialStatePropertyAll(18)),
        ),
      ),
      body: Center(
        child: Form(
          key: fPC.firstFormKey,
          child: Column(
            children: [
              const AuthTitle(
                title: 'Forget Password',
                subTitle: 'Enter you email address',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: AuthField(
                  label: 'email',
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
                child: AuthButton(
                    text: 'Confirm',
                    onPressed: () {
                      //fPC.goToOtp();
                      Get.toNamed(AppRoute.forgotPasswordOTP);
                    },
                    color: AppColors.myPrimary),
              ),
              AuthSuggestion(
                  question: 'remembered password ? ',
                  suggestion: ' sign in',
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
