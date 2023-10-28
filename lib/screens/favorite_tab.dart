import 'package:flutter/material.dart';
import '../helper/color_pallet.dart';
import '../helper/media_query.dart';
import '../widgets/favorite_product.dart';

class FavoriteTab extends StatelessWidget with ColorPallet {
  FavoriteTab({super.key});

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
      const FavoriteProduct(
          path: 'assets/images/potato.png', price: 7.6, title: 'Potato'),
      const FavoriteProduct(
          path: 'assets/images/tomato.png', price: 10.6, title: 'Tomato'),
      const FavoriteProduct(
          path: 'assets/images/red_onion.jpeg', price: 4.6, title: 'Red Onion'),
    ]);
  }
}
