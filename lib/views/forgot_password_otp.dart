import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/forgot_password_controller.dart';

class ForgotPassOTP extends StatelessWidget {
  const ForgotPassOTP({super.key});

  //todo: implement timer and otp field
  @override
  Widget build(BuildContext context) {
    ForgotPassController fPC = Get.find();
    return Scaffold(
      body: ListView(),
    );
  }
}
