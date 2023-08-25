import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hunter/controllers/login_controller.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  //todo: implement toggle button
  @override
  Widget build(BuildContext context) {
    LoginController lC = Get.put(LoginController());
    return Scaffold(
      body: ListView(
        children: [
          Form(
            key: lC.loginFormKey,
            child: Column(
              children: [
                //todo: implement validators
                TextFormField(controller: lC.email),
                TextFormField(controller: lC.password),
              ],
            ),
          ),
        ],
      ),
    );
  }
}