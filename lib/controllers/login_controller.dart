import 'dart:async';

import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
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
    // to check if input is correct from client side (to not send unnecessary requests to server)
    if (isValid) {
      toggleLoading(true);
      try {
        // get token from http request
        // if its null throw exception
        // else, store token in local storage
        // get of all pages to home page
      } on TimeoutException {
        // show "operation is taking so long"
      } catch (e) {
        // don't do anything here, handle it from the http method itself
      } finally {
        toggleLoading(false);
      }
    }
  }
}
