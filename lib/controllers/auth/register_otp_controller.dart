import 'dart:async';
import 'package:get/get.dart';
import 'package:hunter/constants/k.dart';
import 'package:hunter/constants/routes_name.dart';
import 'package:hunter/services/remote_services.dart';
import 'package:hunter/widgets/snake_bar.dart';
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
        Get.offAllNamed(AppRoute.doctorHome);
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
      Get.showSnackbar(mySnackBar(messageText: 'wait till time is up".tr'));
    }
  }


}
