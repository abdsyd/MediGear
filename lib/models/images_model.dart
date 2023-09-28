import 'dart:convert';

List<ImageModel> imagesModelFromJson(String str) => List<ImageModel>.from(json.decode(str).map((x) => ImageModel.fromJson(x)));

String imagesModelToJson(List<ImageModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ImageModel {
  int id;
  String path;

  ImageModel({
    required this.id,
    required this.path,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
    id: json["id"],
    path: json["path"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "path": path,
  };
}
