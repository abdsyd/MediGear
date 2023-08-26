import 'dart:async';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:timer_count_down/timer_controller.dart';

class RegisterController extends GetxController {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController rePassword = TextEditingController();
  final TextEditingController phone = TextEditingController();

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

  Future<void> register() async {
    buttonPressed = true;
    bool isValid = registerFormKey.currentState!.validate();
    if (isValid) {
      toggleLoading(true);
      try {
        //
      } on TimeoutException {
        //
      } catch (e) {
        //
      } finally {
        toggleLoading(false);
      }
    }
  }

  List<bool> isSelected = [true,false];

  void toggleSelections (int newIndex) {
    for (int index = 0 ; index < isSelected.length ; index++) {
      if (index == newIndex) {
        isSelected[index] = true;
      }else {
        isSelected[index] = false;
      }
    }
    update();
  }

  //--------------------------------------------------------------------------------
  final OtpFieldController otpController = OtpFieldController();
  final CountdownController timeController = CountdownController(autoStart: true);

  /// don't mind these for now
  late String _registerToken; // its the same as access token , it can also be used to verify otp
  late String _verifyUrl;

  bool _isTimeUp = false;
  bool get isTimeUp => _isTimeUp;
  void toggleTimerState(bool val) {
    _isTimeUp = val;
    update();
  }

  bool _isLoadingOtp = false;
  bool get isLoadingOtp => _isLoadingOtp;
  void toggleLoadingOtp(bool value) {
    _isLoadingOtp = value;
    update();
  }

  Future<void> verifyOtp(String pin) async {
    if (_isTimeUp) {
      // ask user to request a new code, or request it yourself
    } else {
      toggleLoadingOtp(true);
      try {
        //
      } on TimeoutException {
        //
      } catch (e) {
        //
      } finally {
        toggleLoadingOtp(false);
      }
    }
  }

  Future<void> resendOtp() async {
    if (_isTimeUp) {
      toggleLoadingOtp(true);
      try {
        //
      } on TimeoutException {
        //
      } catch (e) {
        //
      } finally {
        toggleLoadingOtp(false);
      }
    } else {
      // show a snackbar to ask user to wait till time is up
    }
  }
}
