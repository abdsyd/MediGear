import 'package:flutter/material.dart';
import 'package:hunter/constants/colors.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class OtpField extends StatelessWidget {
  const OtpField({
    super.key,
    required this.controller,
    required this.onFinished,
  });

  final OtpFieldController controller;
  final void Function(String) onFinished;

  @override
  Widget build(BuildContext context) {
    return OTPTextField(
      onChanged: (String pin) {},
      controller: controller,
      length: 5,
      width: MediaQuery.of(context).size.width,
      fieldWidth: MediaQuery.of(context).size.width / 6.5,
      style: Theme.of(context).textTheme.displayMedium!.copyWith(color: Colors.black),
      textFieldAlignment: MainAxisAlignment.spaceAround,
      fieldStyle: FieldStyle.box,
      onCompleted: onFinished,
      otpFieldStyle: OtpFieldStyle(
        focusBorderColor: AppColors.myPrimary,
      ),
      outlineBorderRadius: 15,
    );
  }
}
