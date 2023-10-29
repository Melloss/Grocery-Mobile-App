import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:glocery_mobile_app/controllers/order_conteroller.dart';
import '../screens/order_tab.dart';
import '../screens/catagory_tab.dart';
import '../helper/color_pallet.dart';
import '../screens/home_tab.dart';
import '../screens/favorite_tab.dart';
import '../screens/account_tab.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>
    with ColorPallet, SingleTickerProviderStateMixin {
  late TabController tabController;
  OrderController orderController = Get.find();

  @override
  void initState() {
    tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: white,
        ),
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: tabController,
        children: [
          const HomeTab(),
          const CatagoryTab(),
          const OrderTab(),
          FavoriteTab(),
          AccountTab(),
        ],
      ),
      bottomNavigationBar: Material(
        color: white,
        child: TabBar(
          labelPadding: const EdgeInsets.symmetric(vertical: 8),
          indicator: const BoxDecoration(),
          tabs: [
            const Tab(
                icon: Icon(
              Icons.home,
              size: 30,
            )),
            const Tab(
                icon: Icon(
              Icons.compare_arrows,
              size: 30,
            )),
            _buildOrderTab(),
            const Tab(
                icon: Icon(
              Icons.favorite,
              size: 30,
            )),
            const Tab(
                icon: Icon(
              Icons.person,
              size: 30,
            )),
          ],
          controller: tabController,
        ),
      ),
    );
  }

  _buildOrderTab() {
    return Tab(
        icon: Stack(
      children: [
        const Icon(
          Icons.shopping_cart,
          size: 30,
        ),
        Obx(
          () => Visibility(
            visible: orderController.orderedProductId.isNotEmpty,
            child: Positioned(
                right: 0,
                top: 0,
                child: Container(
                  width: 17,
                  height: 17,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.orange,
                  ),
                  child: Center(
                      child: Text(
                    '${orderController.orderedProductId.length}',
                    style: const TextStyle(
                      fontSize: 8,
                      color: Colors.white,
                    ),
                  )),
                )),
          ),
        ),
      ],
    ));
  }
}
