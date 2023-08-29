import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hunter/constants/colors.dart';
import 'package:hunter/widgets/auth_button.dart';
import 'package:hunter/widgets/auth_suggestion.dart';
import 'package:hunter/widgets/auth_title.dart';
import 'package:hunter/widgets/otp_field.dart';
import 'package:hunter/widgets/otp_timer.dart';
import '../controllers/forgot_password_controller.dart';

class ForgotPassOTP extends StatelessWidget {
  const ForgotPassOTP({super.key});

  @override
  Widget build(BuildContext context) {
    ForgotPassController fPC = Get.find();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
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
                  const AuthTitle(
                    title: 'Verification',
                    subTitle:
                        'please enter the code that sent to your email \n this code will expire in ',
                  ),
                  GetBuilder<ForgotPassController>(
                    builder: (controller) => OtpTimer(
                      controller: controller.timeController,
                      timerColor: controller.isTimeUp
                          ? Colors.red
                          : AppColors.myPrimary,
                      onFinished: (){
                        controller.toggleTimerState(true);
                      },
                    ),
                  ),
                ],
              ),
              OtpField(
                controller: fPC.otpController,
                onCompleted: (pin){fPC.verifyOtp(pin);},
              ),
              AuthButton(
                  text: 'Verify',
                  onPressed: () {},),
              AuthSuggestion(
                  question: 'didn\'t receive a code? ',
                  suggestion: 'resend',
                  onTap: () {
                    fPC.resendOtp();
                  },)
            ],
          ),
        ),
      ),
    );
  }
}
