import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hunter/constants/routes_name.dart';

class LoginMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    //LoginController lC = Get.find();
    GetStorage getStorage = GetStorage();
    print(getStorage.read("role"));
    if (getStorage.hasData('token')) {
      //todo : read role from local storage
      if (getStorage.read("role") == "dentist") {
        return const RouteSettings(name: AppRoute.doctorHome);
      } else if (getStorage.read("role") == "supplier") {
        return const RouteSettings(name: AppRoute.supplierHome);
      } else {
        Get.defaultDialog(title: "admins are not allowed here go f urself");
      }
    } else
      return const RouteSettings(name: AppRoute.login);
  }
}
