import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hunter/constants/colors.dart';
import 'package:hunter/widgets/auth_button.dart';
import 'package:hunter/widgets/auth_suggestion.dart';
import 'package:hunter/widgets/auth_title.dart';
import 'package:hunter/widgets/otp_field.dart';
import 'package:timer_count_down/timer_count_down.dart';
import '../controllers/forgot_password_controller.dart';

class ForgotPassOTP extends StatelessWidget {
  const ForgotPassOTP({super.key});

  //todo: implement timer and otp field
  @override
  Widget build(BuildContext context) {
    ForgotPassController fPC = Get.find();
    return Scaffold(
      //resizeToAvoidBottomInset: false,
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
                    builder: (controller) => Countdown(
                      controller: controller.timeController,
                      seconds: 180,
                      build: (context, double time) => Text(
                        time.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(
                                color: controller.isTimeUp
                                    ? Colors.red
                                    : AppColors.myPrimary),
                      ),
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
              //const SizedBox(height: 50,),
              AuthButton(
                  text: 'Verify', onPressed: () {}, color: AppColors.myPrimary),
              AuthSuggestion(
                  question: 'didn\'t receive a code? ',
                  suggestion: 'resend',
                  onTap: () {})
            ],
          ),
        ),
      ),
    );
  }
}
