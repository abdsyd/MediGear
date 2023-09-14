import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hunter/constants/routes_name.dart';
import 'package:hunter/services/remote_services.dart';

class ProfileController extends GetxController{

  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController rePassword = TextEditingController();
  final TextEditingController phone = TextEditingController();

  GlobalKey<FormState> detailsFormKey = GlobalKey<FormState>();

  bool buttonPressed = false;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void toggleLoading(bool value) {
    _isLoading = value;
    update();
  }

  bool _passwordVisible = false;
  bool get passwordVisible => _passwordVisible;
  void togglePasswordVisibility(bool value) {
    _passwordVisible = value;
    update();
  }

  //File? image;

//   Future pickImage(ImageSource source) async {
//
//       final image = await ImagePicker().pickImage(source: source);
//       if (image == null) return;
//
//       this.image = File(image.path);
//
//       update();
//
// }

  void logOut() async {
    if (await RemoteServices.signOut()) {
      Get.offAllNamed(AppRoute.login);
    }
  }

}