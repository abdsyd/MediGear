import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/forgot_password_controller.dart';

class ForgotPass2View extends StatelessWidget {
  const ForgotPass2View({super.key});

  //todo: to enter the new password and confirm new password
  @override
  Widget build(BuildContext context) {
    ForgotPassController fPC = Get.find();
    return ListView(
      children: [
        Form(
          child: Column(
            children: [
              //todo: implement validators
              TextFormField(controller: fPC.newPassword),
              TextFormField(controller: fPC.reNewPassword),
            ],
          ),
        )
      ],
    );
  }
}
