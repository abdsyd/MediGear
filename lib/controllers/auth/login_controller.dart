import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hunter/constants/k.dart';
import 'package:hunter/constants/routes_name.dart';
import 'package:hunter/models/login_model.dart';
import 'package:hunter/services/remote_services.dart';

class LoginController extends GetxController {
  LogInModel? _loggedUser;
  LogInModel? get loggedUser => _loggedUser;

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
        _loggedUser = await RemoteServices.login(email.text, password.text)
            .timeout(kTimeOutDuration);
        if (_loggedUser == null) throw Exception();
        _getStorage.write('token', _loggedUser!.accessToken);
         if (_loggedUser!.role == 'supplier') {
          Get.offAllNamed(AppRoute.supplierHome);
        } else {
           Get.offAllNamed(AppRoute.doctorHome);
         }
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
