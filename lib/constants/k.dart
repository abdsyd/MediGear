import 'package:get/get.dart';

Future kTimeOutDialog() => Get.defaultDialog(
    title: "error".tr,
    middleText: "operation is taking so long, please check your internet "
        "connection or try again later.");
