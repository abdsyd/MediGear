import 'dart:convert';
import 'dart:io';
import 'package:hunter/models/brand_model.dart';
import 'package:hunter/models/category_model.dart';
import 'package:hunter/models/images_model.dart';
import 'package:hunter/models/login_model.dart';
import 'package:hunter/models/product_model.dart';
import 'package:path/path.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:hunter/constants/k.dart';
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

  static Future<LogInModel?> login(String email, String password) async {
    var response = await client.post(
      Uri.parse("$_hostIP/login"),
      body: jsonEncode({"email": email, "password": password}),
      headers: {'Content-Type': 'application/json', "Accept": 'application/json'},
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return logInModelFromJson(response.body);
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
      kSessionExpiredDialog();
      return true;
    } else {
      Get.defaultDialog(title: "error".tr, middleText: jsonDecode(response.body)["message"]);
      return false;
    }
  }

  ///////////// Profile \\\\\\\\\\\\\\\

  static Future<bool> uploadProfileImage(File? imageFile) async {
    var request = http.MultipartRequest("POST", Uri.parse("$_hostIP/upload-profile-image"));
    request.headers['Authorization'] = "Bearer $token";
    request.headers['Accept'] = 'application/json';
    var stream = http.ByteStream(imageFile!.openRead());
    var length = await imageFile.length();
    var multipartFile = http.MultipartFile(
      'image',
      stream,
      length,
      filename: basename(imageFile.path),
    );
    request.files.add(multipartFile);

    var response = await request.send();
    var responseBody = await response.stream.bytesToString();

    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      print('error massage: $responseBody');
      return false;
    }
  }

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

  ///////////// brand \\\\\\\\\\\\\\\

  static Future<List<BrandModel>?> fetchAllBrands() async {
    var response = await client.get(
      Uri.parse('$_hostIP/brands'),
      headers: {
        'Content-Type': 'application/json',
        "Accept": 'application/json',
        "Authorization": "Bearer $token",
      },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return brandModelFromJson(response.body);
    } else {
      Get.defaultDialog(title: "error".tr, middleText: jsonDecode(response.body)["message"]);
      return null;
    }
  }

  static Future<BrandModel?> fetchABrand(int brandId) async {
    var response = await client.get(
      Uri.parse('$_hostIP/brands/$brandId'),
      headers: {
        'Content-Type': 'application/json',
        "Accept": 'application/json',
        "Authorization": "Bearer $token",
      },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return BrandModel.fromJson(jsonDecode(response.body));
    } else {
      Get.defaultDialog(title: "error".tr, middleText: jsonDecode(response.body)["message"]);
      return null;
    }
  }

  static Future<List<ProductModel>?> fetchBrandProducts(int brandId) async {
    var response = await client.get(
      Uri.parse('$_hostIP/brand-products/$brandId'),
      headers: {
        'Content-Type': 'application/json',
        "Accept": 'application/json',
        "Authorization": "Bearer $token",
      },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return productModelFromJson(response.body);
    } else {
      Get.defaultDialog(title: "error".tr, middleText: jsonDecode(response.body)["message"]);
      return null;
    }
  }

  ///////////// category \\\\\\\\\\\\\\\

  static Future<List<CategoryModel>?> fetchAllParentCategories() async {
    var response = await client.get(
      Uri.parse('$_hostIP/categories'),
      headers: {
        'Content-Type': 'application/json',
        "Accept": 'application/json',
        "Authorization": "Bearer $token",
      },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return categoryModelFromJson(response.body);
    } else {
      Get.defaultDialog(title: "error".tr, middleText: jsonDecode(response.body)["message"]);
      return null;
    }
  }

  static Future<List<CategoryModel>?> fetchAllChildCategories() async {
    var response = await client.get(
      Uri.parse('$_hostIP/categories/all-children'),
      headers: {
        'Content-Type': 'application/json',
        "Accept": 'application/json',
        "Authorization": "Bearer $token",
      },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return categoryModelFromJson(response.body);
    } else {
      Get.defaultDialog(title: "error".tr, middleText: jsonDecode(response.body)["message"]);
      return null;
    }
  }

  static Future<List<CategoryModel>?> fetchCategoryDetails(int categoryId) async {
    var response = await client.get(
      Uri.parse('$_hostIP/category-details/$categoryId'),
      headers: {
        'Content-Type': 'application/json',
        "Accept": 'application/json',
        "Authorization": "Bearer $token",
      },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return categoryModelFromJson(response.body);
    } else {
      Get.defaultDialog(title: "error".tr, middleText: jsonDecode(response.body)["message"]);
      return null;
    }
  }

///////////// product \\\\\\\\\\\\\\\

  //todo: product images (add, edit)
  //todo: send categories ids not categories, map every category to category.id (add, edit)
  static Future<bool?> addProducts(
    String title,
    String description,
    String upc,
    bool active,
    BrandModel brand,
    List<ImageModel> images,
    List<int> categories,
    double price,
    double weight,
    double width,
    double height,
    double length,
    int quantity,
    int sellQuantity,
    int maxPurchaseQty,
    int minPurchaseQty,
  ) async {
    var response = await client.post(
      Uri.parse('$_hostIP/products'),
      body: jsonEncode({
        "title": title,
        "description": description,
        "price": price,
        "weight": weight,
        "length": length,
        "width": width,
        "height": height,
        "quantity": quantity,
        "sell_quantity": sellQuantity,
        "max_purchase_qty": maxPurchaseQty,
        "min_purchase_qty": minPurchaseQty,
        "active": active,
        "upc": upc,
        "images": images,
        "categories": categories,
        "brand": brand.title,
      }),
      headers: {
        'Content-Type': 'application/json',
        "Accept": 'application/json',
        "Authorization": "Bearer $token",
      },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      Get.defaultDialog(title: "error".tr, middleText: jsonDecode(response.body)["message"]);
      return false;
    }
  }

  static Future<bool?> editProducts(
    int productId,
    String title,
    String description,
    String upc,
    bool active,
    BrandModel brand,
    List<ImageModel> images,
    List<int> categories,
    double price,
    double weight,
    double width,
    double height,
    double length,
    int quantity,
    int sellQuantity,
    int maxPurchaseQty,
    int minPurchaseQty,
  ) async {
    var response = await client.patch(
      Uri.parse('$_hostIP/products/$productId'),
      body: jsonEncode({
        "title": title,
        "description": description,
        "price": price,
        "weight": weight,
        "length": length,
        "width": width,
        "height": height,
        "quantity": quantity,
        "sell_quantity": sellQuantity,
        "max_purchase_qty": maxPurchaseQty,
        "min_purchase_qty": minPurchaseQty,
        "active": active,
        "upc": upc,
        "images": images,
        "categories": categories,
        "brand": brand.title,
      }),
      headers: {
        'Content-Type': 'application/json',
        "Accept": 'application/json',
        "Authorization": "Bearer $token",
      },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      Get.defaultDialog(title: "error".tr, middleText: jsonDecode(response.body)["message"]);
      return false;
    }
  }

  static Future<List<ProductModel>?> fetchAllProducts() async {
    var response = await client.get(
      Uri.parse('$_hostIP/products'),
      headers: {
        'Content-Type': 'application/json',
        "Accept": 'application/json',
        "Authorization": "Bearer $token",
      },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return productModelFromJson(response.body);
    } else {
      Get.defaultDialog(title: "error".tr, middleText: jsonDecode(response.body)["message"]);
      return null;
    }
  }

  static Future<ProductModel?> fetchAProduct(int productId) async {
    var response = await client.get(
      Uri.parse('$_hostIP/products/$productId'),
      headers: {
        'Content-Type': 'application/json',
        "Accept": 'application/json',
        "Authorization": "Bearer $token",
      },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return ProductModel.fromJson(jsonDecode(response.body));
    } else {
      Get.defaultDialog(title: "error".tr, middleText: jsonDecode(response.body)["message"]);
      return null;
    }
  }

  static Future<bool?> deleteProduct(int productId) async {
    var response = await client.delete(
      Uri.parse('$_hostIP/products/$productId'),
      headers: {
        'Content-Type': 'application/json',
        "Accept": 'application/json',
        "Authorization": "Bearer $token",
      },
    );
    if (response.statusCode == 204) {
      return true;
    } else {
      Get.defaultDialog(title: "error".tr, middleText: jsonDecode(response.body)["message"]);
      return false;
    }
  }
}
