import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/order_conteroller.dart';
import '../helper/color_pallet.dart';
import '../helper/media_query.dart';
import '../widgets/favorite_product.dart';

// ignore: must_be_immutable
class FavoriteTab extends StatelessWidget with ColorPallet {
  FavoriteTab({super.key});
  OrderController orderController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        width: screenWidth(context),
        color: white,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Text(
          'Favorite\'s',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      for (int i = 0; i < orderController.favoriteProductId.length; i++)
        FavoriteProduct(
          id: orderController.favoriteProductId[i],
          path:
              '${orderController.imageBaseUrl}${orderController.products[orderController.favoriteProductId[i]].primaryImage}',
          price: orderController
              .products[orderController.favoriteProductId[i]].price,
          title: orderController
              .products[orderController.favoriteProductId[i]].title,
        ),
    ]);
  }
}
