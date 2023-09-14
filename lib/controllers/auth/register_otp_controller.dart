import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hunter/constants/k.dart';
import 'package:hunter/constants/routes_name.dart';
import 'package:hunter/services/remote_services.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:timer_count_down/timer_controller.dart';

class RegisterOTPController extends GetxController {
  final OtpFieldController otpController = OtpFieldController();
  final CountdownController timeController = CountdownController(autoStart: true);

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

  @override
  void onInit() async {
    _verifyUrl = (await RemoteServices.sendRegisterOtp().timeout(kTimeOutDuration))!;
    super.onInit();
  }

  Future<void> verifyOtp(String pin) async {
    print(pin);
    // if (_isTimeUp) {
    //   Get.defaultDialog(middleText: "otp time up dialog".tr);
    // } else {
    toggleLoadingOtp(true);
    try {
      if (await RemoteServices.verifyRegisterOtp(pin, _verifyUrl).timeout(kTimeOutDuration)) {
        Get.offAllNamed(AppRoute.home);
        Get.defaultDialog(middleText: "verified!".tr);
      }
    } on TimeoutException {
      kTimeOutDialog();
    } catch (e) {
      //
    } finally {
      toggleLoadingOtp(false);
    }
    //}
  }

  Future<void> resendOtp() async {
    if (_isTimeUp) {
      toggleLoadingOtp(true);
      try {
        _verifyUrl = (await RemoteServices.sendRegisterOtp().timeout(kTimeOutDuration))!;
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
}
