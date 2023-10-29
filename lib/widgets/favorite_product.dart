import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/order_conteroller.dart';
import '../helper/color_pallet.dart';
import '../helper/media_query.dart';

class FavoriteProduct extends StatefulWidget {
  final int id;
  final String path;
  final String title;
  final String price;
  const FavoriteProduct(
      {super.key,
      required this.path,
      required this.title,
      required this.price,
      required this.id});

  @override
  State<FavoriteProduct> createState() => _FavoriteProductState();
}

class _FavoriteProductState extends State<FavoriteProduct> with ColorPallet {
  bool isFavorite = true;
  OrderController orderController = Get.find();
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      child: !isFavorite
          ? const SizedBox.shrink()
          : Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: screenWidth(context),
                  height: 140,
                  color: white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Image.network(
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
                          width: 93,
                          height: 113,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 17),
                          Text(
                            widget.title,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Expanded(child: Container()),
                          Text(
                            '${widget.price} birr',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontSize: 20,
                                  color: lightYellow,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          const SizedBox(height: 17),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          if (!orderController.orderedProductId
                              .contains(widget.id)) {
                            orderController.orderedProductId.add(widget.id);
                            orderController
                                .products[widget.id].orderedQuantity = 1;
                          }
                          orderController.calculateTotlaPrice();
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: 113,
                            height: 35,
                            decoration: BoxDecoration(
                              color: iconColor.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: const Center(child: Text('Add To Cart')),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    right: 30,
                    top: 30,
                    child: GestureDetector(
                      child: Icon(
                        Icons.favorite,
                        color: isFavorite ? favoriteIconColor : iconColor,
                        size: 35,
                      ),
                      onTap: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                        if (orderController.favoriteProductId
                            .contains(widget.id)) {
                          orderController.products[widget.id].isFavorite.value =
                              false;
                          orderController.favoriteProductId.remove(widget.id);
                        }
                      },
                    ))
              ],
            ),
    );
  }
}
