import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../controllers/order_conteroller.dart';
import '../helper/color_pallet.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> with ColorPallet {
  @override
  void initState() {
    OrderController orderController = Get.find();
    orderController.getUser();
    orderController.getProducts();
    Timer(
      const Duration(seconds: 2),
      () {
        Get.offNamed('/signin');
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightYellow,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: lightYellow,
        ),
      ),
      body: Column(
        children: [
          Expanded(child: Container()),
          Image.asset(
            'assets/images/glocery_icon.png',
            width: 131,
            height: 197,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 38),
          Text(
            'Fresh Fruits',
            style: Theme.of(context).textTheme.displayLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 100)
        ],
      ),
    );
  }
}
