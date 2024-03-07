import 'package:ecommerce_app_2/constants/size_config.dart';
import 'package:flutter/material.dart';

class LatestProductWidget extends StatelessWidget {
  const LatestProductWidget({
    super.key,
    required this.image,
  });
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      height: Sizeconfig.designHeight * 2,
      width: Sizeconfig.designWidth * 0.4,
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
      child: Image.network(image),
    );
  }
}
