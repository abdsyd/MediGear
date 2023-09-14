import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hunter/constants/k.dart';
import 'package:hunter/constants/routes_name.dart';
import 'package:hunter/services/remote_services.dart';

class LoginController extends GetxController {
  final _getStorage = GetStorage();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void toggleLoading(bool value) {
    _isLoading = value;
    update();
  }

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  bool buttonPressed = false;

  bool _passwordVisible = false;
  bool get passwordVisible => _passwordVisible;
  void togglePasswordVisibility(bool value) {
    _passwordVisible = value;
    update();
  }

  void login() async {
    buttonPressed = true;
    bool isValid = loginFormKey.currentState!.validate();
    if (isValid) {
      toggleLoading(true);
      try {
        String? token = await RemoteServices.login(email.text, password.text).timeout(kTimeOutDuration);
        if (token == null) throw Exception();
        _getStorage.write("token", token);
        Get.offAllNamed(AppRoute.home);
      } on TimeoutException {
        kTimeOutDialog();
      } catch (e) {
        //
      } finally {
        toggleLoading(false);
      }
    }
  }
}
