import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/product_detail.dart';
import '../controllers/order_conteroller.dart';
import '../helper/color_pallet.dart';
import '../helper/media_query.dart';

class ProductCard extends StatefulWidget {
  final int id;
  final String path;
  final String title;
  final double price;
  const ProductCard({
    super.key,
    required this.path,
    required this.title,
    required this.price,
    required this.id,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> with ColorPallet {
  OrderController orderController = Get.find();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Get.to(() => ProductDetail(id: widget.id));
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
                  Image.network(
                    widget.path,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      } else {
                        return Container(
                            height: 100,
                            alignment: Alignment.bottomCenter,
                            child: CircularProgressIndicator(
                              color: orange.withOpacity(0.5),
                            ));
                      }
                    },
                    width: 120,
                    height: 141,
                    alignment: Alignment.bottomCenter,
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
                              '${widget.price} birr',
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
                            if (!orderController.orderedProductId
                                .contains(widget.id)) {
                              orderController.orderedProductId.add(widget.id);
                              orderController
                                  .products[widget.id].orderedQuantity = 1;
                            }
                            orderController.calculateTotlaPrice();
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
                if (orderController.products[widget.id].isFavorite.value) {
                  orderController.favoriteProductId.remove(widget.id);
                }
                orderController.products[widget.id].isFavorite.value =
                    !orderController.products[widget.id].isFavorite.value;

                if (orderController.products[widget.id].isFavorite.value &&
                    !orderController.favoriteProductId.contains(widget.id)) {
                  orderController.favoriteProductId.add(widget.id);
                }
              },
              child: Obx(
                () => Icon(
                  Icons.favorite,
                  color: orderController.products[widget.id].isFavorite.value
                      ? favoriteIconColor
                      : iconColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
