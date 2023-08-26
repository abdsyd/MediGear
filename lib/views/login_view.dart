import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hunter/constants/colors.dart';
import 'package:hunter/constants/routes_name.dart';
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
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            size: 17,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/MediGear2.jpg'),
              fit: BoxFit.fill),
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
                  height:10,
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
            const SizedBox(
              height:15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Form(
                key: lC.loginFormKey,
                child: Column(
                  children: [
                    AuthField(
                      label: 'email',
                      obscureText: false,
                      textController: lC.email,
                      keyboardType: TextInputType.emailAddress,
                      validator: (val){
                        return validateInput(lC.email.text, 8, 100, 'email');
                      },
                      onChanged: (val) {
                        if (lC.buttonPressed) {
                          lC.loginFormKey.currentState!.validate();
                        }
                      },
                    ),
                    GetBuilder<LoginController>(builder: (controller) => AuthField(
                      label: 'password',
                      obscureText: !controller.passwordVisible,
                      icon: controller.passwordVisible ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
                      onIconPressed: (){
                        controller.togglePasswordVisibility(!controller.passwordVisible);
                      },
                      textController: controller.password,
                      keyboardType: TextInputType.text,
                      validator: (val){
                        return validateInput(controller.password.text, 8, 100, 'password');
                      },
                      onChanged: (val) {
                        if (controller.buttonPressed) {
                          controller.loginFormKey.currentState!.validate();
                        }
                      },
                    ),)
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: AuthButton(
                text: 'Login',
                onPressed: () {
                  lC.login();
                },
                color: AppColors.myPrimary,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'don\'t have an account ',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.black,),
                ),
                InkWell(
                  child: Text(
                    'Sign Up',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 12,),
                  ),
                  onTap: () {
                    Get.offAllNamed(AppRoute.register);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
