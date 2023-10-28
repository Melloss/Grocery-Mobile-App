import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/ordered_product.dart';
import '../helper/color_pallet.dart';

class OrderTab extends StatefulWidget {
  const OrderTab({super.key});

  @override
  State<OrderTab> createState() => _OrderTabState();
}

class _OrderTabState extends State<OrderTab> with ColorPallet {
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
            flex: 15,
            child: Container(
              color: homeScaffoldColor,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: const [
                  OrderedProduct(path: 'assets/images/banana.png'),
                  OrderedProduct(path: 'assets/images/mushroom.png'),
                  OrderedProduct(path: 'assets/images/tomato.png'),
                  OrderedProduct(path: 'assets/images/red_onion.jpeg'),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: homeScaffoldColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                    child: Text(
                      'Total \$6',
                      style: Theme.of(context).textTheme.titleLarge,
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
