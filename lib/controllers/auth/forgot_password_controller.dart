import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hunter/constants/k.dart';
import 'package:hunter/constants/routes_name.dart';
import 'package:hunter/services/remote_services.dart';
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
        if (await RemoteServices.sendForgotPasswordOtp(email.text).timeout(kTimeOutDuration)) {
          Get.toNamed(AppRoute.forgotPasswordOTP);
        }
      } on TimeoutException {
        kTimeOutDialog();
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

  String? _resetToken;
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
    toggleLoadingOtp(true);
    try {
      String? resetToken = await RemoteServices.verifyForgotPasswordOtp(email.text, pin).timeout(kTimeOutDuration);
      if (resetToken != null) {
        _resetToken = resetToken;
        Get.toNamed(AppRoute.forgotPassword2);
      }
    } on TimeoutException {
      kTimeOutDialog();
    } catch (e) {
      //
    } finally {
      toggleLoadingOtp(false);
    }
  }

  void resendOtp() async {
    if (_isTimeUp) {
      toggleLoadingOtp(true);
      try {
        await RemoteServices.sendForgotPasswordOtp(email.text).timeout(kTimeOutDuration);
        timeController.restart();
        otpController.clear();
        _isTimeUp = false;
      } on TimeoutException {
        kTimeOutDialog();
      } catch (e) {
        //
      } finally {
        toggleLoadingOtp(false);
      }
    } else {
      Get.showSnackbar(GetSnackBar(
        messageText: Text(
          "wait till time is up".tr,
          textAlign: TextAlign.center,
          //style: kTextStyle14.copyWith(color: Colors.white),
        ),
        backgroundColor: Colors.grey.shade800,
        duration: const Duration(milliseconds: 800),
        borderRadius: 30,
        maxWidth: 150,
        margin: const EdgeInsets.only(bottom: 50),
      ));
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

  void resetPass(String password, String passwordConfirmation) async {
    button2Pressed = true;
    bool isValid = secondFormKey.currentState!.validate();
    if (isValid) {
      toggleLoading2(true);
      try {
        if (await RemoteServices.resetPassword(email.text, password, passwordConfirmation, _resetToken!)
            .timeout(kTimeOutDuration)) {
          Get.offAllNamed(AppRoute.login);
          Get.defaultDialog(middleText: "password changed successfully".tr);
        }
      } on TimeoutException {
        kTimeOutDialog();
      } catch (e) {
        //
      } finally {
        toggleLoading2(false);
      }
    }
  }
}
