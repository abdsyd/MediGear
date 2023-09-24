class ProductModel {
  String title;
  double price;
  String description;
  String imageUrl;
  int quantity;
  String category;
  String barcode;

  ProductModel({
    required this.category,
    required this.title,
    required this.price,
    required this.description,
    required this.imageUrl,
    required this.quantity,
    required this.barcode,
  });
}