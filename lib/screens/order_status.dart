import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../controllers/order_conteroller.dart';
import '../helper/get_snackbar.dart';
import '../helper/media_query.dart';
import '../helper/color_pallet.dart';

// ignore: must_be_immutable
class OrderStatus extends StatelessWidget with ColorPallet {
  OrderStatus({super.key});
  OrderController orderController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Column(
        children: [
          Container(
            width: screenWidth(context),
            height: 50,
            color: white,
            child: Center(
              child: Text('Thank You',
                  style: Theme.of(context).textTheme.titleLarge),
            ),
          ),
          Expanded(child: Container()),
          Column(children: [
            Image.asset('assets/images/ordered_status_image.png'),
            const SizedBox(height: 20),
            Text(
              'Your Order in process',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.center,
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: black,
                      fontSize: 15,
                    ),
              ),
            )
          ]),
          Expanded(child: Container()),
          GestureDetector(
            onTap: () {
              if (orderController.orderedProductId.isNotEmpty) {
                orderController.resetEveryOrder();
                Get.offAllNamed('/home');
                getSnackBar('Success', 'You Ordered Successfully!');
              } else {
                Get.offAllNamed('/home');
                getSnackBar('No Order', 'The Cart is Empty!');
              }
            },
            child: Container(
              height: 60,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                color: lightYellow,
                borderRadius: BorderRadius.circular(32),
              ),
              child: Center(
                  child: Text(
                'GO BACK HOME',
                style: Theme.of(context).textTheme.titleLarge,
              )),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
