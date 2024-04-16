import 'package:ecommerce_app_2/constants/size_config.dart';
import 'package:ecommerce_app_2/constants/text_style.dart';
import 'package:ecommerce_app_2/models/sneakers_class.dart';
import 'package:flutter/material.dart';

class PriceAndColorsWidget extends StatelessWidget {
  const PriceAndColorsWidget({
    super.key,
    required this.sneaker,
  });

  final SneakerClass sneaker;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //price
        Text("\$${sneaker.price}",
            style: appStyle(fw: FontWeight.w600, size: 26)
                .copyWith(color: Colors.black)),
        //colors
        Row(
          children: [
            Text("Colors",
                style: appStyle(fw: FontWeight.w500, size: 18)
                    .copyWith(color: Colors.black)),
            SizedBox(width: 5 * Sizeconfig.horizontalBlock),
            const CircleAvatar(
              radius: 7,
              backgroundColor: Colors.black,
            ),
            SizedBox(width: 5 * Sizeconfig.horizontalBlock),
            const CircleAvatar(
              radius: 7,
              backgroundColor: Colors.red,
            ),
          ],
        ),
      ],
    );
  }
}
