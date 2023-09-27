import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hunter/constants/routes_name.dart';

final GetStorage _getStorage = GetStorage();

Duration kTimeOutDuration = const Duration(seconds: 25);
Duration kTimeOutDuration2 = const Duration(seconds: 15);

String kHostIP = "http://10.0.2.2:8000";

Future kTimeOutDialog() => Get.defaultDialog(
    title: "error".tr,
    middleText: "operation is taking so long, please check your internet "
        "connection or try again later.");

Future kSessionExpiredDialog() => Get.defaultDialog(
    barrierDismissible: false,
    title: 'Session Expired',
    middleText: 'Please log in again',
    textConfirm: 'ok',
    onConfirm: () {
      Get.offAllNamed(AppRoute.login);
      _getStorage.remove("token");
    });

void hideKeyboard(BuildContext context) {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus) {
    currentFocus.unfocus();
  }
}
