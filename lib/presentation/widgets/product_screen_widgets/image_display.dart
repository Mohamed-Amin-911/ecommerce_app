import 'package:ecommerce_app_2/constants/color.dart';
import 'package:ecommerce_app_2/constants/size_config.dart';
import 'package:ecommerce_app_2/controllers/product_provider.dart';
import 'package:ecommerce_app_2/models/sneakers_class.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ImageDisplayWidget extends StatelessWidget {
  const ImageDisplayWidget({
    super.key,
    required this.sneaker,
    required this.pageController,
  });

  final SneakerClass sneaker;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizeconfig.screenHeight * 0.4,
      width: Sizeconfig.screenWidth,
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: sneaker.imageUrl.length,
        controller: pageController,
        onPageChanged: (value) {
          Provider.of<ProductProvider>(context, listen: false).activePage =
              value;
        },
        itemBuilder: (context, index) {
          //image
          return Container(
            margin: const EdgeInsetsDirectional.only(top: 50),
            height: Sizeconfig.screenHeight * 0.1,
            width: Sizeconfig.screenWidth,
            color: Pallete.bg,
            child: Image.network(
              sneaker.imageUrl[index],
            ),
          );
        },
      ),
    );
  }
}
