import 'package:ecommerce_app_2/constants/size_config.dart';
import 'package:ecommerce_app_2/constants/text_style.dart';
import 'package:ecommerce_app_2/models/sneakers_class.dart';
import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
    required this.sneaker,
  });

  final SneakerClass sneaker;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 0.8 * Sizeconfig.screenWidth,
      child: Text(
        sneaker.title,
        style: appStyle(fw: FontWeight.bold, size: 19)
            .copyWith(color: Colors.black),
      ),
    );
  }
}
