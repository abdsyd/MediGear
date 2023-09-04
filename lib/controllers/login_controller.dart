import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
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

  void login(String email ,String password) async {
    buttonPressed = true;
    bool isValid = loginFormKey.currentState!.validate();
    if (isValid) {
      toggleLoading(true);
      try {
        String? accessToken = await RemoteServices.login(email, password).timeout(const Duration(seconds: 25));
        if (accessToken == null) throw Exception();
        _getStorage.write("token", accessToken);
        Get.offAll(AppRoute.home);
      } on TimeoutException {
        Get.defaultDialog(
            title: "error".tr,
            middleText: "operation is taking so long, please check your internet "
                "connection or try again later.");
      } catch (e) {

      } finally {
        toggleLoading(false);
      }
    }
  }
}
