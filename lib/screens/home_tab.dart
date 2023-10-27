import 'package:flutter/material.dart';
import '../helper/color_pallet.dart';

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
                    top: 3,
                    right: 3,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: lightYellow,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: white,
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
          child: Row(children: [
            Image.asset(
              'assets/images/fruits1.png',
            ),
            _buildCatagoryCard('assets/images/meshrooms.png'),
          ]),
        )
      ],
    );
  }

  _buildCatagoryCard(String path) {
    return Container(
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
}
