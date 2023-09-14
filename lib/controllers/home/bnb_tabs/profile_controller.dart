import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hunter/constants/k.dart';
import 'package:hunter/constants/routes_name.dart';
import 'package:hunter/services/remote_services.dart';

class ProfileController extends GetxController{

  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController rePassword = TextEditingController();
  final TextEditingController phone = TextEditingController();

  GlobalKey<FormState> detailsFormKey = GlobalKey<FormState>();

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

  void saveChanges(String name, String phone) async {
    editProfileButtonPressed = true;
    bool isValid = detailsFormKey.currentState!.validate();
    if (isValid) {
      toggleLoadingEdit(true);
      try {
        bool editDetails = false;
        if (name.isNotEmpty && phone.isNotEmpty) {
          editDetails = await RemoteServices.editProfile(name, phone);
        }
        if (editDetails) {
          Get.back();
          Get.defaultDialog(title: "success".tr, middleText: "changes will take effect in seconds");
        }
      } on TimeoutException {
        kTimeOutDialog();
      } catch (e) {
        print(e.toString());
      } finally {
        toggleLoadingEdit(false);
      }
    }
  }

  void changePassword(String oldPass, String newPass) async {
    editPasswordButtonPressed = true;
    bool isValid = detailsFormKey.currentState!.validate();
    if (isValid) {
      toggleLoadingEdit(true);
      try {
        bool editPassword = false;
        if (oldPass.isNotEmpty && newPass.isNotEmpty) {
          editPassword = await RemoteServices.editPassword(newPass,oldPass);
        }
        if (editPassword) {
          Get.back();
          Get.defaultDialog(title: "password Changed successfully".tr, middleText: "changes will take effect in seconds");
        }
      } on TimeoutException {
        kTimeOutDialog();
      } catch (e) {
        print(e.toString());
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