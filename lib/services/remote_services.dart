import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:hunter/constants/k.dart';
import 'package:hunter/constants/routes_name.dart';
import 'package:hunter/models/user_model.dart';

class RemoteServices {
  static const String _hostIP = "http://10.0.2.2:8000/api";
  static final GetStorage _getStorage = GetStorage();
  static var client = http.Client();
  static String get token => _getStorage.read('token');

  ///////////// Auth \\\\\\\\\\\\\\\

  static Future<String?> register(
      String email, String password, String rePassword, String name, String phone, String role) async {
    var response = await client.post(
      Uri.parse("$_hostIP/register"),
      body: jsonEncode({
        "name": name,
        "email": email,
        "phone": phone,
        "password": password,
        "password_confirmation": rePassword,
        "role": role,
      }),
      headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body)["access_token"];
    } else {
      Get.defaultDialog(title: "error".tr, middleText: jsonDecode(response.body)["message"]);
      return null;
    }
  }

  static Future<String?> login(String email, String password) async {
    var response = await client.post(
      Uri.parse("$_hostIP/login"),
      body: jsonEncode({"email": email, "password": password}),
      headers: {'Content-Type': 'application/json', "Accept": 'application/json'},
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body)["access_token"];
    } else {
      Get.defaultDialog(title: "error".tr, middleText: jsonDecode(response.body)["message"]);
      return null;
    }
  }

  static Future<bool> signOut() async {
    var response = await client.get(
      Uri.parse("$_hostIP/logout"),
      headers: {
        'Content-Type': 'application/json',
        "Accept": 'application/json',
        "Authorization": "Bearer $token",
      },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      print('logout success');
      return true;
    } else if (response.statusCode == 401 || response.statusCode == 403) {
      print('logout fail');
      kSessionExpiredDialog();
      return true;
    } else {
      Get.defaultDialog(title: "error".tr, middleText: jsonDecode(response.body)["message"]);
      return false;
    }
  }

  ///////////// Profile \\\\\\\\\\\\\\\

  //todo: add request for image

  static Future<UserModel?> fetchCurrentUser() async {
    var response = await client.get(
      Uri.parse("$_hostIP/profile"),
      headers: {
        'Content-Type': 'application/json',
        "Accept": 'application/json',
        "Authorization": "Bearer $token",
      },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return userModelFromJson(response.body);
    } else if (response.statusCode == 401 || response.statusCode == 403) {
      print('get user');
      kSessionExpiredDialog();
      return null;
    } else {
      Get.defaultDialog(title: "error".tr, middleText: jsonDecode(response.body)["error"]);
      return null;
    }
  }

  static Future<bool> editProfile(String name, String phone) async {
    var response = await client.post(
      Uri.parse('$_hostIP/edit-profile'),
      body: jsonEncode({
        'name': name,
        'phone': phone,
      }),
      headers: {
        'Content-Type': 'application/json',
        "Accept": 'application/json',
        "Authorization": "Bearer $token",
      },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else if (response.statusCode == 401 || response.statusCode == 403) {
      print('edit prof');
      kSessionExpiredDialog();
      return false;
    } else {
      Get.defaultDialog(title: "error".tr, middleText: jsonDecode(response.body)["message"]);
      return false;
    }
  }

  static Future<bool> editPassword(String newPassword, String currentPassword) async {
    var response = await client.post(
      Uri.parse('$_hostIP/edit-password'),
      body: jsonEncode({
        'current_password': currentPassword,
        'new_password': newPassword,
      }),
      headers: {
        'Content-Type': 'application/json',
        "Accept": 'application/json',
        "Authorization": "Bearer $token",
      },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else if (response.statusCode == 401 || response.statusCode == 403) {
      print('edit pass');
      kSessionExpiredDialog();
      return false;
    } else {
      Get.defaultDialog(title: "error".tr, middleText: jsonDecode(response.body)["message"]);
      return false;
    }
  }

  ///////////// OTP \\\\\\\\\\\\\\\

  static Future<String?> sendRegisterOtp() async {
    var response = await client.get(
      Uri.parse("$_hostIP/send-register-otp"),
      headers: {
        'Content-Type': 'application/json',
        "Accept": 'application/json',
        "Authorization": "Bearer $token",
      },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body)["url"];
    } else {
      Get.defaultDialog(title: "error".tr, middleText: jsonDecode(response.body)["message"]);
      return null;
    }
  }

  static Future<bool> verifyRegisterOtp(String otp, String url) async {
    var response = await client.post(
      Uri.parse(url),
      body: jsonEncode({
        'otp': otp,
      }),
      headers: {
        'Content-Type': 'application/json',
        "Accept": 'application/json',
        "Authorization": "Bearer $token",
      },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else if (response.statusCode == 400) {
      Get.defaultDialog(title: "error".tr, middleText: "wrong code");
      return false;
    } else {
      Get.defaultDialog(title: "error".tr, middleText: jsonDecode(response.body)["message"]);
      return false;
    }
  }

  static Future<bool> sendForgotPasswordOtp(String email) async {
    var response = await client.post(
      Uri.parse('$_hostIP/send-reset-otp'),
      body: jsonEncode({
        'email': email,
      }),
      headers: {
        'Content-Type': 'application/json',
        "Accept": 'application/json',
      },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      Get.defaultDialog(
        title: "error".tr,
        middleText: jsonDecode(response.body)["message"],
      );
      return false;
    }
  }

  static Future<String?> verifyForgotPasswordOtp(String email, String otp) async {
    var response = await client.post(
      Uri.parse('$_hostIP/verify-reset-otp'),
      body: jsonEncode({
        'email': email,
        'otp': otp,
      }),
      headers: {
        'Content-Type': 'application/json',
        "Accept": 'application/json',
      },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body)["reset_token"];
    } else if (response.statusCode == 400) {
      Get.defaultDialog(title: "error".tr, middleText: "wrong code");
      return null;
    } else {
      Get.defaultDialog(title: "error".tr, middleText: jsonDecode(response.body)["message"]);
      return null;
    }
  }

  static Future<bool> resetPassword(
      String email, String password, String passwordConfirmation, String resetToken) async {
    var response = await client.post(Uri.parse('$_hostIP/reset-password'),
        body: jsonEncode({
          'email': email,
          'password': password,
          'password_confirmation': passwordConfirmation,
          'token': resetToken,
        }),
        headers: {
          'Content-Type': 'application/json',
          "Accept": 'application/json',
        });
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      Get.defaultDialog(title: "error".tr, middleText: jsonDecode(response.body)["message"]);
      return false;
    }
  }
}
