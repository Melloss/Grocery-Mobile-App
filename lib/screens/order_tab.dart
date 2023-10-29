import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/order_conteroller.dart';
import '../widgets/ordered_product.dart';
import '../helper/color_pallet.dart';

class OrderTab extends StatefulWidget {
  const OrderTab({super.key});

  @override
  State<OrderTab> createState() => _OrderTabState();
}

class _OrderTabState extends State<OrderTab> with ColorPallet {
  OrderController orderController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Text(
              'Item details',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            flex: 16,
            child: Container(
              color: homeScaffoldColor,
              child: ListView.builder(
                itemCount: orderController.orderedProductId.length,
                itemBuilder: (context, index) {
                  return OrderedProduct(
                    id: orderController.orderedProductId[index],
                    path:
                        '${orderController.imageBaseUrl}${orderController.products[orderController.orderedProductId[index]].primaryImage}',
                  );
                },
                physics: const BouncingScrollPhysics(),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              padding: const EdgeInsets.only(top: 10),
              color: homeScaffoldColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                    child: Obx(
                      () => Text(
                        'Total: ${orderController.totalPrice.value} birr',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/order_status');
                    },
                    child: Container(
                      height: 50,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      decoration: BoxDecoration(
                        color: lightYellow,
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: Center(
                          child: Text(
                        'PLACE ORDER',
                        style: Theme.of(context).textTheme.titleLarge,
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
