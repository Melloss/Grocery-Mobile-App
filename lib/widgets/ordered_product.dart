import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/order_conteroller.dart';
import '../helper/color_pallet.dart';
import '../helper/media_query.dart';

class OrderedProduct extends StatefulWidget {
  final int id;
  final String path;
  const OrderedProduct({super.key, required this.path, required this.id});

  @override
  State<OrderedProduct> createState() => _OrderedProductState();
}

class _OrderedProductState extends State<OrderedProduct> with ColorPallet {
  OrderController orderController = Get.find();
  bool showProduct = true;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: showProduct,
      child: Container(
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
                  orderController.products[widget.id].catagory[0],
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  orderController.products[widget.id].title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Expanded(child: Container()),
                Text(
                  '${orderController.products[widget.id].price} birr',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 20,
                        color: lightYellow,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                const SizedBox(height: 17),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              alignment: Alignment.bottomCenter,
              child: Container(
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
                            orderController
                                .products[widget.id].orderedQuantity--;
                          });
                          if (orderController
                                  .products[widget.id].orderedQuantity ==
                              0) {
                            setState(() {
                              showProduct = false;
                            });
                            orderController.orderedProductId.remove(widget.id);
                          }
                          orderController.calculateTotlaPrice();
                        },
                        child: Text(
                          '-',
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontSize: 28,
                                    color: lightYellow,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                      Text(
                        '${orderController.products[widget.id].orderedQuantity}',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontSize: 24,
                              color: black,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            orderController
                                .products[widget.id].orderedQuantity++;
                          });
                          orderController.calculateTotlaPrice();
                        },
                        child: Text(
                          '+',
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontSize: 28,
                                    color: lightYellow,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      )
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
