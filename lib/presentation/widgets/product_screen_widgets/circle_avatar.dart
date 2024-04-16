import 'package:ecommerce_app_2/constants/size_config.dart';
import 'package:ecommerce_app_2/controllers/product_provider.dart';
import 'package:ecommerce_app_2/models/sneakers_class.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CircleAvatarWidget extends StatelessWidget {
  const CircleAvatarWidget({
    super.key,
    required this.sneaker,
  });

  final SneakerClass sneaker;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: Sizeconfig.screenHeight * 0.34,
        right: 0,
        left: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              sneaker.imageUrl.length,
              (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: CircleAvatar(
                      radius: 5,
                      backgroundColor:
                          Provider.of<ProductProvider>(context).activePage !=
                                  index
                              ? Colors.grey
                              : Colors.black,
                    ),
                  )),
        ));
  }
}
