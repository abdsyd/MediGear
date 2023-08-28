import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hunter/constants/colors.dart';
import 'package:hunter/controllers/register_controller.dart';
import 'package:hunter/widgets/auth_button.dart';
import 'package:hunter/widgets/auth_suggestion.dart';
import 'package:hunter/widgets/auth_title.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:timer_count_down/timer_count_down.dart';

class RegisterOTP extends StatelessWidget {
  const RegisterOTP({super.key});

  //todo: implement timer and otp field
  @override
  Widget build(BuildContext context) {
    RegisterController rC = Get.find();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const BackButton(
          style: ButtonStyle(iconSize: MaterialStatePropertyAll(18)),
        ),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const AuthTitle(
                title: 'Verification',
                subTitle: 'please enter the code that sent to test@email.com \n this code will expire in ',
              ),
              Countdown(
                controller: rC.timeController,
                seconds: 180,
                build: (_, double time) => Text(
                  time.toString(),
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(color: rC.isTimeUp ? Colors.red : AppColors.myPrimary),
                ),
                onFinished: () {
                  rC.toggleTimerState(true);
                },
              ),
              OTPTextField(
                controller: rC.otpController,
                length: 5,
                width: MediaQuery.of(context).size.width ,
                fieldWidth: MediaQuery.of(context).size.width /6.5,
                style:Theme.of(context).textTheme.displayMedium!.copyWith(color: Colors.black),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.box,
                otpFieldStyle: OtpFieldStyle(
                  focusBorderColor: AppColors.myPrimary,
                ),
                outlineBorderRadius: 15,
                onCompleted: (pin) {
                },
                //onChanged: (val){},
              ),
              //const SizedBox(height: 50,),
              AuthButton(text: 'Verify', onPressed: (){}, color: AppColors.myPrimary),
              AuthSuggestion(question: 'didn\'t receive a code? ', suggestion: 'resend', onTap: (){})

            ],
          ),
        ),
      ),
    );
  }
}
