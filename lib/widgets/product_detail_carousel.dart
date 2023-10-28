import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helper/color_pallet.dart';
import '../helper/media_query.dart';

class ProductDetailCarousel extends StatefulWidget {
  const ProductDetailCarousel({super.key});

  @override
  State<ProductDetailCarousel> createState() => _ProductDetailCarouselState();
}

class _ProductDetailCarouselState extends State<ProductDetailCarousel>
    with ColorPallet {
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight(context),
      child: Stack(
        children: [
          CarouselSlider(
            carouselController: carouselController,
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
              height: screenHeight(context) * 0.6,
              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: true,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              scrollDirection: Axis.horizontal,
            ),
            items: [
              _buildBackgroundImage(),
              _buildBackgroundImage(),
              _buildBackgroundImage(),
            ],
          ),
          Positioned(
            top: 60,
            left: 10,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: white,
              ),
              onPressed: () {
                Get.back();
              },
            ),
          ),
          _buildCarouselBullets(),
        ],
      ),
    );
  }

  _buildBackgroundImage() {
    return Image.asset(
      'assets/images/product_detail_backgroun_image.jpeg',
      width: screenWidth(context),
      fit: BoxFit.fitWidth,
    );
  }

  _buildCarouselBullets() {
    return Positioned(
        left: 0,
        right: 0,
        bottom: 470,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSingleBullet(0),
            _buildSingleBullet(1),
            _buildSingleBullet(2),
          ],
        ));
  }

  _buildSingleBullet(int id) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: 30,
      height: 7,
      decoration: BoxDecoration(
        color: id == currentIndex ? white : iconColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
