import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:hunter/constants/routes_name.dart';

class RemoteServices {
  static const String _hostIP = "http://10.0.2.2:8000/api";
  static final GetStorage _getStorage = GetStorage();
  static var client = http.Client();
  static String token = _getStorage.read('token');

  static Future<String?> register(String email, String password, String name, String phone,String role) async {
    var response = await client.post(Uri.parse("$_hostIP/register"),
      body: jsonEncode({
        "name": name,
        "email": email,
        "phone": phone,
        "password": password,
        "password_confirmation": password,
        "role": role,

      }),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      _getStorage.write('token',jsonDecode(response.body)["access_token"] );
      return jsonDecode(response.body)["access_token"];

    } else {
      Get.defaultDialog(
          title: "error".tr, middleText: jsonDecode(response.body)["message"]);
      return null;
    }
  }

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

  static Future<String?> login(String email, String password) async {
    var response = await client.post(
      Uri.parse("$_hostIP/login"),
      body: jsonEncode({"email": email, "password": password}),
      headers: {'Content-Type': 'application/json', "Accept": 'application/json'},
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body)["AccessToken"];
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
      return true;
    } else if (response.statusCode == 401 || response.statusCode == 403) {
      Get.offAll(AppRoute.login);
      _getStorage.remove("token");
      return true;
    } else {
      Get.defaultDialog(title: "error".tr, middleText: jsonDecode(response.body)["message"]);
      return false;
    }
  }

}
