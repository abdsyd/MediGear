import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hunter/constants/k.dart';
import 'package:hunter/constants/routes_name.dart';
import 'package:hunter/models/user_model.dart';
import 'package:hunter/services/remote_services.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  ProfileController({required this.user}); //constructor
  @override
  void onInit() {
    // to pre populate text fields
    name.text = user.name;
    phone.text = user.phone;
    super.onInit();
  }

  late UserModel user;
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController rePassword = TextEditingController();
  final TextEditingController phone = TextEditingController();

  GlobalKey<FormState> detailsFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> passwordsFormKey = GlobalKey<FormState>();

  bool editProfileButtonPressed = false;
  bool editPasswordButtonPressed = false;
  bool _isLoadingEdit = false;
  bool get isLoadingEdit => _isLoadingEdit;

  void toggleLoadingEdit(bool value) {
    _isLoadingEdit = value;
    update();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void toggleLoading(bool value) {
    _isLoading = value;
    update();
  }

  bool _currentPasswordVisible = false;
  bool get currentPasswordVisible => _currentPasswordVisible;
  void toggleCurrentPasswordVisibility(bool value) {
    _currentPasswordVisible = value;
    update();
  }

  bool _newPasswordVisible = false;
  bool get newPasswordVisible => _newPasswordVisible;
  void toggleNewPasswordVisibility(bool value) {
    _newPasswordVisible = value;
    update();
  }

  Future pickImage(File? image,{required ImageSource source}) async {
    final returnedImage =
    await ImagePicker().pickImage(source: source);
    if (returnedImage != null) {
      image = File(returnedImage.path);
    } else {}
    update();
  }

  void saveChanges() async {
    editProfileButtonPressed = true;
    bool isValid = detailsFormKey.currentState!.validate();
    if (isValid) {
      toggleLoadingEdit(true);
      try {
        //
        bool editDetails = false;
        if (name.text.isNotEmpty && phone.text.isNotEmpty) {
          editDetails = await RemoteServices.editProfile(name.text, phone.text);
        }
        if (editDetails) {
          Get.back();
          Get.defaultDialog(title: "success".tr, middleText: "changes will take effect in seconds");
        }
      } on TimeoutException {
        kTimeOutDialog();
      } catch (e) {
        //
      } finally {
        toggleLoadingEdit(false);
      }
    }
  }

  void changePassword(String oldPass, String newPass) async {
    editPasswordButtonPressed = true;
    bool isValid = passwordsFormKey.currentState!.validate();
    if (isValid) {
      toggleLoadingEdit(true);
      try {
        bool editPassword = false;
        if (oldPass.isNotEmpty && newPass.isNotEmpty) {
          editPassword = await RemoteServices.editPassword(newPass, oldPass);
        }
        if (editPassword) {
          Get.back();
          Get.defaultDialog(
              title: "password Changed successfully".tr, middleText: "changes will take effect in seconds");
        }
      } on TimeoutException {
        kTimeOutDialog();
      } catch (e) {
        //
      } finally {
        toggleLoadingEdit(false);
      }
    }
  }

  void logOut() async {
    if (await RemoteServices.signOut()) {
      Get.offAllNamed(AppRoute.login);
    }
  }
}
