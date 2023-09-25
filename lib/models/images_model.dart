import 'dart:convert';

List<ImagesModel> imagesModelFromJson(String str) => List<ImagesModel>.from(json.decode(str).map((x) => ImagesModel.fromJson(x)));

String imagesModelToJson(List<ImagesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ImagesModel {
  int id;
  String path;

  ImagesModel({
    required this.id,
    required this.path,
  });

  factory ImagesModel.fromJson(Map<String, dynamic> json) => ImagesModel(
    id: json["id"],
    path: json["path"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "path": path,
  };
}
