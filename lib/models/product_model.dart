import 'dart:convert';

import 'package:hunter/models/brand_model.dart';
import 'package:hunter/models/category_model.dart';
import 'package:hunter/models/images_model.dart';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  int id;
  String title;
  String description;
  String price;
  String weight;
  String length;
  String width;
  String height;
  int quantity;
  int sellQuantity;
  int maxPurchaseQty;
  int minPurchaseQty;
  int active;
  String upc;
  String sku;
  List<ImagesModel> images;
  List<CategoryModel> categories;
  BrandModel brand;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.weight,
    required this.length,
    required this.width,
    required this.height,
    required this.quantity,
    required this.sellQuantity,
    required this.maxPurchaseQty,
    required this.minPurchaseQty,
    required this.active,
    required this.upc,
    required this.sku,
    required this.images,
    required this.categories,
    required this.brand,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    price: json["price"],
    weight: json["weight"],
    length: json["length"],
    width: json["width"],
    height: json["height"],
    quantity: json["quantity"],
    sellQuantity: json["sell_quantity"],
    maxPurchaseQty: json["max_purchase_qty"],
    minPurchaseQty: json["min_purchase_qty"],
    active: json["active"],
    upc: json["upc"],
    sku: json["sku"],
    images: List<ImagesModel>.from(json["images"].map((x) => ImagesModel.fromJson(x))),
    categories: List<CategoryModel>.from(json["categories"].map((x) => CategoryModel.fromJson(x))),
    brand: BrandModel.fromJson(json["brand"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
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
    "sku": sku,
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    "brand": brand.toJson(),
  };
}




