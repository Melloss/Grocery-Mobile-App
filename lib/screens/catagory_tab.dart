import 'package:flutter/material.dart';
import '../helper/color_pallet.dart';

class CatagoryTab extends StatefulWidget {
  const CatagoryTab({super.key});

  @override
  State<CatagoryTab> createState() => _CatagoryTabState();
}

class _CatagoryTabState extends State<CatagoryTab> with ColorPallet {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          alignment: Alignment.center,
          color: white,
          child: Text(
            'Categories',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Wrap(
              children: [
                _buildCatagoryCard('assets/images/fruits2.png'),
                _buildCatagoryCard('assets/images/vetables.png'),
                _buildCatagoryCard('assets/images/mushrooms2.png'),
                _buildCatagoryCard('assets/images/dairy2.png'),
                _buildCatagoryCard('assets/images/oats2.png'),
                _buildCatagoryCard('assets/images/breads.png'),
                _buildCatagoryCard('assets/images/rices.png'),
                _buildCatagoryCard('assets/images/eggs.png'),
              ],
            ),
          ),
        )
      ],
    );
  }

  _buildCatagoryCard(String path) {
    return Container(
      width: 138,
      height: 138,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28.3),
          boxShadow: [
            BoxShadow(
              color: iconColor,
              blurRadius: 10,
              spreadRadius: 5,
            )
          ],
          color: white,
          image: DecorationImage(
            image: AssetImage(path),
          )),
    );
  }
}
