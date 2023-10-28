import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helper/color_pallet.dart';
import '../helper/media_query.dart';

class ProductCard extends StatefulWidget {
  final String path;
  final String title;
  final double price;
  const ProductCard(
      {super.key,
      required this.path,
      required this.title,
      required this.price});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> with ColorPallet {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed('/product_detail');
            },
            child: Container(
              height: 250,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(18),
              ),
              width: screenWidth(context) * 0.42,
              child: Column(
                children: [
                  Image.asset(
                    widget.path,
                    width: 120,
                    height: 141,
                    alignment: Alignment.center,
                  ),
                  Expanded(child: Container()),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.title,
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              '\$${widget.price}',
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                    fontSize: 15,
                                  ),
                            )
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            //TODO: Add To Cart
                            print('add to cart');
                          },
                          child: Text(
                            'Add to cart',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  color: favoriteIconColor,
                                  fontSize: 11,
                                ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
              child: Icon(
                Icons.favorite,
                color: isFavorite ? favoriteIconColor : iconColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
