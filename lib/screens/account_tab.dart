import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/order_conteroller.dart';
import '../helper/color_pallet.dart';
import '../helper/media_query.dart';

// ignore: must_be_immutable
class AccountTab extends StatelessWidget with ColorPallet {
  AccountTab({super.key});
  OrderController orderController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Container(
        width: screenWidth(context),
        color: white,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Text(
          'Your Account',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 30, left: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Icon(Icons.person),
            ),
            const SizedBox(width: 40),
            Text(
              orderController.user!.name,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Expanded(child: Container()),
            IconButton(
                onPressed: () {
                  orderController.resetEveryOrder();
                  Get.offAllNamed('/signin');
                },
                icon: const Icon(Icons.logout)),
            const SizedBox(width: 10),
          ],
        ),
      ),
    ]);
  }
}
