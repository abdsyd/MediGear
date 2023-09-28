import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String name;
  String email;
  String phone;
  dynamic imgUrl;
  String role;
  bool isVerified;

  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.imgUrl,
    required this.role,
    required this.isVerified,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        imgUrl: json["image"],
        role: json["role"],
        isVerified: json["is_verified"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone": phone,
        "img_url": imgUrl,
        "role": role,
        "is_verified": isVerified,
      };
}
