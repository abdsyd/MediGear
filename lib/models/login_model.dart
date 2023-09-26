import 'dart:convert';

LogInModel logInModelFromJson(String str) => LogInModel.fromJson(json.decode(str));

String logInModelToJson(LogInModel data) => json.encode(data.toJson());

class LogInModel {
  int user;
  String role;
  String accessToken;

  LogInModel({
    required this.user,
    required this.role,
    required this.accessToken,
  });

  factory LogInModel.fromJson(Map<String, dynamic> json) => LogInModel(
    user: json["user"],
    role: json["role"],
    accessToken: json["access_token"],
  );

  Map<String, dynamic> toJson() => {
    "user": user,
    "role": role,
    "access_token": accessToken,
  };
}
