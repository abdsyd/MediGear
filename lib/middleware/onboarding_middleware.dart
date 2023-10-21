import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hunter/constants/routes_name.dart';

class OnBoardingMiddleware extends GetMiddleware {
  @override
  int? get priority => 2;

  @override
  RouteSettings? redirect(String? route) {
    if (GetStorage().read('onboarding') == true) {
      return const RouteSettings(name: AppRoute.login);
    }
    return null;
  }
}
