import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  static const _kTabs = [
    Tab(
        icon: Icon(
      Icons.home,
      size: 30,
    )),
    Tab(
        icon: Icon(
      Icons.compare_arrows,
      size: 30,
    )),
    Tab(
        icon: Icon(
      Icons.shopping_cart,
      size: 30,
    )),
    Tab(
        icon: Icon(
      Icons.favorite,
      size: 30,
    )),
    Tab(
        icon: Icon(
      Icons.person,
      size: 30,
    )),
  ];

  @override
  void initState() {
    tabController = TabController(length: _kTabs.length, vsync: this);
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
          tabs: _kTabs,
          controller: tabController,
        ),
      ),
    );
  }
}
