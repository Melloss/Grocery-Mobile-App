import 'package:get/get.dart' show RxBool;

class Product {
  final int id;
  final String title;
  final String price;
  final String primaryImage;
  final String detailImage;
  RxBool isFavorite;
  final List catagory;
  int orderedQuantity;
  Product({
    this.orderedQuantity = 0,
    required this.detailImage,
    required this.id,
    required this.title,
    required this.price,
    required this.primaryImage,
    required this.isFavorite,
    required this.catagory,
  });
}
