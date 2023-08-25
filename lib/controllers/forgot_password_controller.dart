import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:timer_count_down/timer_controller.dart';

class ForgotPassController extends GetxController {
  final TextEditingController email = TextEditingController();

  bool _isLoading1 = false;
  bool get isLoading1 => _isLoading1;
  void toggleLoading1(bool value) {
    _isLoading1 = value;
    update();
  }

  GlobalKey<FormState> firstFormKey = GlobalKey<FormState>();
  bool button1Pressed = false;

  Future<void> goToOtp() async {
    button1Pressed = true;
    bool isValid = firstFormKey.currentState!.validate();
    if (isValid) {
      toggleLoading1(true);
      try {
        // if email exists, go to forgot pass otp view
      } on TimeoutException {
        //
      } catch (e) {
        //
      } finally {
        toggleLoading1(false);
      }
    }
  }

  //--------------------------------------------------------------------------------
  //for otp screen
  final OtpFieldController otpController = OtpFieldController();
  final CountdownController timeController = CountdownController(autoStart: true);

  late String _resetToken;
  // this is a token we get after validating otp to insure that the account belongs to the user with this email.
  // do not confuse it with "access token" that we get after a successful login or register

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

  void verifyOtp(String pin) async {
    if (_isTimeUp) {
      // ask user to request new otp code or do it yourself
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

  void resendOtp() async {
    if (_isTimeUp) {
      toggleLoadingOtp(true);
      try {
        // request a new otp
        timeController.restart();
        otpController.clear();
        _isTimeUp = false;
      } on TimeoutException {
        //
      } catch (e) {
        //
      } finally {
        toggleLoadingOtp(false);
      }
    } else {
      // ask user to wait until time is up
    }
  }

  //--------------------------------------------------------------------------------
  //for second screen
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController reNewPassword = TextEditingController();

  GlobalKey<FormState> secondFormKey = GlobalKey<FormState>();
  bool button2Pressed = false;

  bool _isLoading2 = false;
  bool get isLoading2 => _isLoading2;
  void toggleLoading2(bool value) {
    _isLoading2 = value;
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

  void resetPass() async {
    button2Pressed = true;
    bool isValid = secondFormKey.currentState!.validate();
    if (isValid) {
      toggleLoading2(true);
      try {
        //make a request to set a new password
      } on TimeoutException {
        //
      } catch (e) {
        //
      } finally {
        toggleLoading2(false);
      }
    }
  }
}
