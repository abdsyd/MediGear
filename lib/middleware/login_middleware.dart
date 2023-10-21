import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hunter/constants/routes_name.dart';
import 'package:hunter/controllers/auth/login_controller.dart';
import 'package:hunter/models/login_model.dart';

class LoginMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;
  LogInModel? user;

  @override
  RouteSettings? redirect(String? route) {
    if (GetStorage().hasData('token')) {
      //todo : make it go to supplier home if role is supplier
      if (user!.role == 'supplier') {
        return const RouteSettings(name: AppRoute.supplierHome);
      } else {
        return const RouteSettings(name: AppRoute.doctorHome);
      }
    }
    return null;
  }
}
