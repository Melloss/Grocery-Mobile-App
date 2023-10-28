import 'package:flutter/material.dart';
import 'package:glocery_mobile_app/helper/color_pallet.dart';
import '../helper/media_query.dart';

class FavoriteProduct extends StatefulWidget {
  final String path;
  final String title;
  final double price;
  const FavoriteProduct(
      {super.key,
      required this.path,
      required this.title,
      required this.price});

  @override
  State<FavoriteProduct> createState() => _FavoriteProductState();
}

class _FavoriteProductState extends State<FavoriteProduct> with ColorPallet {
  bool isFavorite = true;
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      child: !isFavorite
          ? const SizedBox.shrink()
          : Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: screenWidth(context),
                  height: 140,
                  color: white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Image.asset(
                          widget.path,
                          width: 93,
                          height: 113,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 17),
                          Text(
                            widget.title,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Expanded(child: Container()),
                          Text(
                            '\$${widget.price}',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontSize: 20,
                                  color: lightYellow,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          const SizedBox(height: 17),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: 113,
                          height: 35,
                          decoration: BoxDecoration(
                            color: iconColor.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: const Center(child: Text('Add To Cart')),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    right: 30,
                    top: 30,
                    child: GestureDetector(
                      child: Icon(
                        Icons.favorite,
                        color: isFavorite ? favoriteIconColor : iconColor,
                        size: 35,
                      ),
                      onTap: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                    ))
              ],
            ),
    );
  }
}
