import 'dart:async';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hunter/constants/k.dart';
import 'package:hunter/constants/routes_name.dart';
import 'package:hunter/services/remote_services.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:timer_count_down/timer_controller.dart';

class RegisterController extends GetxController {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController rePassword = TextEditingController();
  final TextEditingController phone = TextEditingController();

  final GetStorage _getStorage = GetStorage();

  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  bool buttonPressed = false;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void toggleLoading(bool value) {
    _isLoading = value;
    update();
  }

  bool _passwordVisible = false;

  bool get passwordVisible => _passwordVisible;

  void togglePasswordVisibility(bool value) {
    _passwordVisible = value;
    update();
  }

  bool _rePasswordVisible = false;

  bool get rePasswordVisible => _rePasswordVisible;

  void toggleRePasswordVisibility(bool value) {
    _rePasswordVisible = value;
    update();
  }

  Future<void> register(String email, String password, String rePassword,
      String name, String phone, String role) async {
    buttonPressed = true;
    bool isValid = registerFormKey.currentState!.validate();
    if (isValid) {
      toggleLoading(true);
      try {
        role == '0' ? role = 'dentist' : role = 'supplier';
        await RemoteServices.register(
                email, password, rePassword, name, phone, role)
            .timeout(kTimeOutDuration);

        Get.toNamed(AppRoute.registerOTP);
      } on TimeoutException {
        kTimeOutDialog();
      } catch (e) {
        //
      } finally {
        toggleLoading(false);
      }
    }
  }

  int selectionRoleIndex = 0;

  List<bool> isSelected = [true, false];

  void toggleSelections(int newIndex) {
    for (int index = 0; index < isSelected.length; index++) {
      if (index == newIndex) {
        isSelected[index] = true;
      } else {
        isSelected[index] = false;
      }
    }
    update();
  }
}
