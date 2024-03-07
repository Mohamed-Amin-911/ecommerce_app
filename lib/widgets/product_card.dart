import 'package:ecommerce_app_2/constants/size_config.dart';
import 'package:ecommerce_app_2/constants/text_style.dart';
import 'package:flutter/material.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({
    super.key,
    required this.image,
    required this.name,
    required this.category,
    required this.price,
    required this.colors,
  });
  final String image;
  final String name;
  final String category;
  final String price;
  final List<Color> colors;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //main container
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                    spreadRadius: 1,
                    offset: Offset(0, 1),
                    blurRadius: 6,
                    color: Color.fromARGB(42, 0, 0, 0))
              ]),
          margin: const EdgeInsets.all(8),
          height: Sizeconfig.designHeight,
          width: Sizeconfig.designWidth * 0.8,
        ),
        //image
        Positioned(
          top: -30,
          child: Container(
            margin: const EdgeInsets.only(left: 30),
            child: Image.network(
                width: Sizeconfig.designWidth * 0.6, fit: BoxFit.fill, image),
          ),
        ),
        Positioned(
          top: 150,
          child: Container(
              margin: const EdgeInsets.only(left: 20),
              width: Sizeconfig.designWidth * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //title
                  Text(
                    name,
                    style: appStyle(fw: FontWeight.bold, size: 36)
                        .copyWith(color: Colors.black, height: 1.1),
                  ),
                  SizedBox(height: 7 * Sizeconfig.verticalBlock),
                  //category
                  Text(
                    category,
                    style: appStyle(fw: FontWeight.bold, size: 17)
                        .copyWith(color: Colors.grey, height: 1.1),
                  ),
                  SizedBox(height: 7 * Sizeconfig.verticalBlock),
                  //colors
                  Row(
                    children: [
                      Text(
                        "\$$price",
                        style: appStyle(fw: FontWeight.bold, size: 36)
                            .copyWith(color: Colors.black, height: 1.1),
                      ),
                      const Spacer(),
                      Text(
                        "Colors  ",
                        style: appStyle(fw: FontWeight.bold, size: 17)
                            .copyWith(color: Colors.grey, height: 1.1),
                      ),
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: colors[0]),
                      )
                    ],
                  ),
                ],
              )),
        ),
        //favourite
        const Positioned(
            right: 20,
            top: 20,
            child: Icon(
              Icons.favorite_border_rounded,
              color: Colors.black,
              size: 30,
            )),
      ],
    );
  }
}
