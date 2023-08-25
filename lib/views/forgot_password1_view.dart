import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hunter/controllers/forgot_password_controller.dart';

class ForgotPass1View extends StatelessWidget {
  const ForgotPass1View({super.key});

  //to enter the email of the account to reset its password
  @override
  Widget build(BuildContext context) {
    ForgotPassController fPC = Get.put(ForgotPassController());
    return Scaffold(
      body: ListView(
        children: [
          Form(
            key: fPC.firstFormKey,
            child: Column(
              children: [
                //todo: implement validators
                TextFormField(controller: fPC.email),
              ],
            ),
          )
        ],
      ),
    );
  }
}
