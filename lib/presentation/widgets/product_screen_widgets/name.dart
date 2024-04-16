import 'package:ecommerce_app_2/constants/text_style.dart';
import 'package:ecommerce_app_2/models/sneakers_class.dart';
import 'package:flutter/material.dart';

class NameWidget extends StatelessWidget {
  const NameWidget({
    super.key,
    required this.sneaker,
  });

  final SneakerClass sneaker;

  @override
  Widget build(BuildContext context) {
    return Text(sneaker.name,
        style: appStyle(fw: FontWeight.bold, size: 40)
            .copyWith(color: Colors.black));
  }
}
