import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hunter/constants/colors.dart';
import 'package:hunter/constants/routes_name.dart';
import 'package:hunter/widgets/auth_button.dart';
import 'package:hunter/widgets/auth_suggestion.dart';
import 'package:hunter/widgets/auth_title.dart';
import 'package:hunter/widgets/otp_field.dart';
import 'package:hunter/widgets/otp_timer.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../controllers/auth/forgot_password_controller.dart';

class ForgotPassOTP extends StatelessWidget {
  const ForgotPassOTP({super.key});

  @override
  Widget build(BuildContext context) {
    ForgotPassController fPC = Get.find();
    return Scaffold(
      appBar: AppBar(

        leading: const BackButton(
          style: ButtonStyle(iconSize: MaterialStatePropertyAll(18)),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                   AuthTitle(
                    title: 'Verification'.tr,
                    subTitle:
                        'please enter the code that sent to your email \n this code will expire in '.tr,
                  ),
                  GetBuilder<ForgotPassController>(
                    builder: (controller) => OtpTimer(
                      controller: controller.timeController,
                      timerColor: controller.isTimeUp
                          ? Colors.red
                          : AppColors.myPrimary,
                      onFinished: () {
                        controller.toggleTimerState(true);
                      },
                    ),
                  ),
                ],
              ),
              OtpField(
                controller: fPC.otpController,
              ),
              GetBuilder<ForgotPassController>(
                builder: (controller) => AuthButton(
                  child: controller.isLoadingOtp
                      ? LoadingAnimationWidget.prograssiveDots(
                      color: Colors.white, size: 40)
                      : Text(
                    'Verify'.tr,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  onPressed: () {
                    controller.verifyOtp(controller.otpController.toString());
                  },
                ),
              ),
              AuthSuggestion(
                question: 'didn\'t receive a code? '.tr,
                suggestion: 'resend'.tr,
                onTap: () {
                  fPC.resendOtp();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
