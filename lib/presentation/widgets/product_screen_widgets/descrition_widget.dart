import 'package:ecommerce_app_2/constants/text_style.dart';
import 'package:ecommerce_app_2/models/sneakers_class.dart';
import 'package:flutter/material.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
    super.key,
    required this.sneaker,
  });

  final SneakerClass sneaker;

  @override
  Widget build(BuildContext context) {
    return Text(
      sneaker.description,
      textAlign: TextAlign.justify,
      // maxLines: 5,
      style: appStyle(fw: FontWeight.normal, size: 14)
          .copyWith(color: Colors.black),
    );
  }
}
