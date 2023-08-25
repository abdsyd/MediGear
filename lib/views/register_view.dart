import 'package:flutter/material.dart';
import 'package:hunter/controllers/register_controller.dart';
import 'package:get/get.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  //todo: implement toggle button
  @override
  Widget build(BuildContext context) {
    RegisterController rC = Get.put(RegisterController());
    return Scaffold(
      body: ListView(
        children: [
          Form(
            key: rC.registerFormKey,
            child: Column(
              children: [
                //todo: implement validators
                TextFormField(controller: rC.name),
                TextFormField(controller: rC.email),
                TextFormField(controller: rC.password),
                TextFormField(controller: rC.rePassword),
                TextFormField(controller: rC.phone),
              ],
            ),
          )
        ],
      ),
    );
  }
}
