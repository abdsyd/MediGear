import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hunter/constants/routes_name.dart';

class LoginMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    if (GetStorage().hasData('token')) {
      //todo : make it go to supplier home if role is supplier
      return const RouteSettings(name: AppRoute.doctorHome);
    }
    return null;
  }
}
