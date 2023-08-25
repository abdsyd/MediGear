import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hunter/constants/colors.dart';
import 'package:hunter/controllers/login_controller.dart';
import 'package:hunter/widgets/auth_button.dart';
import 'package:hunter/widgets/auth_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  //todo: implement toggle button
  @override
  Widget build(BuildContext context) {
    LoginController lC = Get.put(LoginController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            size: 20,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/MediGear2.jpg'),fit: BoxFit.fill),
        ),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          children: [
            Column(
              children: [
                Text(
                  'Login',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(color: Colors.black),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Login to your account',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.grey.shade700),
                ),
              ],
            ),
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Form(
                key: lC.loginFormKey,
                child: const Column(
                  children: [
                    AuthField(label: 'email', obscureText: false),
                    AuthField(label: 'password', obscureText: true),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: AuthButton(
                text: 'Login',
                onPressed: () {},
                color: AppColors.myPrimary,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'don\'t have an account ',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.black,fontSize: 15),
                ),
                InkWell(
                  child: Text(
                    'Sign Up',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20),
                  ),
                  onTap: (){},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
