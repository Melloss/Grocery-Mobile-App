import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/user.dart';
import '../models/product.dart';
import '../helper/get_snackbar.dart';

class OrderController extends GetxController {
  List<Product> products = [];
  RxList orderedProductId = [].obs;
  List favoriteProductId = [];
  RxDouble totalPrice = 0.0.obs;
  User? user;
  String token =
      "eyJhbGciOiJQUzUxMiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIyMGY3OWEzZC04NmQ4LTQ3NjEtYjc5ZS1hMzEyOWU0OGIwYTUiLCJuYmYiOjE2OTg1MjE2OTB9.pNdODOuPYnjdxyCxFMW9dFXUePkrbxRQ6l3jIPCy8M82-apP0LbZR80-UvvH4s_fJr4kNUnk0QWF4sKK3dtnwM8mq3hYjHd4Ji0DLgQM91jkkpu2QvB73POVDrSV7-XB31z1E7-4g0ugcfQM1_3zk1qQaunRt3lKy1aKQmpoGOtY2lcUqtFK5uCAmI5ONvxu2B8Y-q5EznWhXKSnMES_rMHAai5Eo4dbf61gSGmI4YymD5UIlwKnBLsUkRDhhxqIQD9K28uQXWF-4o15MgX0osdFheV4B8KmP7_IjpzdyxZ2xLwxY4RAKwJTMtUYVH2pne5Fs-nazCjcjyhjIPVlwQ";
  String imageBaseUrl = 'https://stagingchipchip.fra1.digitaloceanspaces.com/';

  Future<void> getUser() async {
    try {
      final response = await http.get(
          Uri.parse('https://stagingapi.chipchip.social/v1/users'),
          headers: {'Authorization': 'Bearer $token'});
      Map data = json.decode(response.body);
      user = User(
        email: data['data']['email'],
        password: '123456',
        phoneNumber: data['data']['phone'],
        name: data['data']['nick_name'],
      );
    } catch (error) {
      getSnackBar('Failed', error.toString());
    }
  }

  Future<void> getProducts() async {
    try {
      final response = await http.get(
          Uri.parse('https://stagingapi.chipchip.social/v1/products'),
          headers: {'Authorization': 'Bearer $token'});
      Map data = json.decode(response.body);
      for (int i = 0; i < data['data'].length!; i++) {
        int id = i;
        String title = data['data'][i]['name'];
        bool isFavorite = data['data'][i]['favorite'];
        String price = data['data'][i]['single_deal']['original_price'];
        String primaryImage = data['data'][i]['primary_image'];
        String detailImage = data['data'][i]['detail_images'][0];
        List catagory = data['data'][i]['tags'];
        products.add(Product(
            detailImage: detailImage,
            id: id,
            title: title,
            price: price,
            primaryImage: primaryImage,
            isFavorite: isFavorite.obs,
            catagory: catagory));
      }
    } catch (error) {
      getSnackBar('Failed', error.toString());
    }
  }

  void calculateTotlaPrice() {
    double sum = 0;
    for (int i = 0; i < orderedProductId.length; i++) {
      int amount = products[orderedProductId[i]].orderedQuantity;
      double price = double.parse(products[orderedProductId[i]].price);
      sum = sum + (amount * price);
    }
    totalPrice.value = sum;
  }

  void resetEveryOrder() {
    totalPrice.value = 0.0;
    for (int i = 0; i < orderedProductId.length; i++) {
      products[orderedProductId[i]].orderedQuantity = 0;
    }
    orderedProductId.clear();
  }
}
