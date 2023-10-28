import 'package:flutter/material.dart';
import '../helper/color_pallet.dart';
import '../widgets/product_card.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> with ColorPallet {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTop(),
        _buildCatagories(),
        _buildLatestProduct(),
      ],
    );
  }

  _buildTop() {
    return Container(
      color: white,
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Good Morning', style: Theme.of(context).textTheme.titleSmall),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Rafatul Islam',
                style: Theme.of(context).textTheme.titleLarge),
            IconButton(
              onPressed: () {},
              icon: Stack(
                children: [
                  Icon(
                    Icons.notifications,
                    size: 30,
                    color: blackIconColor,
                  ),
                  Positioned(
                    top: 2,
                    right: 2,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: lightYellow,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: white,
                          width: 2,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        )
      ]),
    );
  }

  _buildCatagories() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Categories',
                  style: Theme.of(context).textTheme.titleMedium),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_right_alt, color: blackIconColor)),
            ],
          ),
        ),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(children: [
            Image.asset(
              'assets/images/fruits1.png',
            ),
            _buildCatagoryCard('assets/images/meshrooms.png'),
            _buildCatagoryCard('assets/images/dairy.png'),
            _buildCatagoryCard('assets/images/oats.png'),
          ]),
        )
      ],
    );
  }

  _buildCatagoryCard(String path) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      width: 94,
      height: 74,
      decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              blurRadius: 15,
              color: iconColor,
              spreadRadius: 5,
            )
          ]),
      child: Image.asset(path),
    );
  }

  _buildLatestProduct() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 28, top: 10),
            child: Text('Latest Products',
                style: Theme.of(context).textTheme.titleMedium),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: const [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ProductCard(
                        path: 'assets/images/orange.jpeg',
                        title: 'Orange',
                        price: 6.7,
                      ),
                      ProductCard(
                        path: 'assets/images/garlic.png',
                        title: 'Garlic',
                        price: 6.7,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ProductCard(
                        path: 'assets/images/mushroom.png',
                        title: 'Broccoli',
                        price: 6.7,
                      ),
                      ProductCard(
                        path: 'assets/images/red_onion.jpeg',
                        title: 'Red Onion',
                        price: 6.7,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ProductCard(
                        path: 'assets/images/banana.png',
                        title: 'Banana',
                        price: 6.7,
                      ),
                      ProductCard(
                        path: 'assets/images/tomato.png',
                        title: 'Tomato',
                        price: 6.7,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ProductCard(
                        path: 'assets/images/potato.png',
                        title: 'Potato',
                        price: 6.7,
                      ),
                      ProductCard(
                        path: 'assets/images/cabbage.png',
                        title: 'Cabbage',
                        price: 6.7,
                      ),
                    ],
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
