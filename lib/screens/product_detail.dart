import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/order_conteroller.dart';
import '../helper/color_pallet.dart';
import '../helper/media_query.dart';
import '../widgets/product_detail_carousel.dart';

class ProductDetail extends StatefulWidget {
  final int id;
  const ProductDetail({super.key, required this.id});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> with ColorPallet {
  int currentAmout = 1;
  OrderController orderController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ProductDetailCarousel(
            id: widget.id,
          ),
          _buildDetail(),
        ],
      ),
    );
  }

  _buildDetail() {
    return Positioned(
      bottom: 0,
      child: Container(
        height: screenHeight(context) * 0.5,
        width: screenWidth(context),
        decoration: BoxDecoration(
          color: white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      orderController.products[widget.id].title,
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            color: black,
                            fontSize: 27,
                          ),
                    ),
                    InkWell(
                      onTap: () {
                        if (!orderController.orderedProductId
                            .contains(widget.id)) {
                          orderController.orderedProductId.add(widget.id);
                        }
                        orderController.products[widget.id].orderedQuantity =
                            currentAmout;
                        orderController.calculateTotlaPrice();
                      },
                      child: Container(
                        width: 120,
                        height: 40,
                        decoration: BoxDecoration(
                          color: lightYellow,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                            child: Text(
                          'ADD TO CART',
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: black,
                                    fontSize: 11,
                                  ),
                        )),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${orderController.products[widget.id].price} birr',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 24,
                            color: lightYellow,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    Container(
                      width: 113,
                      height: 35,
                      decoration: BoxDecoration(
                        color: iconColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  currentAmout--;
                                });
                                orderController.calculateTotlaPrice();
                              },
                              child: Text(
                                '-',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      fontSize: 28,
                                      color: lightYellow,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Text(
                              '$currentAmout',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    fontSize: 24,
                                    color: black,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  currentAmout++;
                                });
                                orderController.calculateTotlaPrice();
                              },
                              child: Text(
                                '+',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      fontSize: 28,
                                      color: lightYellow,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            )
                          ]),
                    )
                  ],
                ),
                _buildDescription(),
              ],
            ),
          )
        ]),
      ),
    );
  }

  _buildDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(
          'Description',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 18,
              ),
        ),
        Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 15),
              color: iconColor.withOpacity(0.5),
              width: screenWidth(context),
              height: 2,
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              color: lightYellow,
              width: 105,
              height: 2,
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\n\n eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam  ',
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: black,
              ),
        ),
      ],
    );
  }
}
