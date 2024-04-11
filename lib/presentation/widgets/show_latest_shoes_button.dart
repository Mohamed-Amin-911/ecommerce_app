import 'package:ecommerce_app_2/constants/text_style.dart';
import 'package:ecommerce_app_2/presentation/screens/product_by_cat.dart';
import 'package:flutter/material.dart';

class ShowLatestShoesbutton extends StatelessWidget {
  const ShowLatestShoesbutton({
    super.key,
    required this.initiallIndex,
  });
  final int initiallIndex;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22))),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductByCatScreen(
                  initialIndex: initiallIndex,
                ),
              ));
        },
        child: Text(
          "show all",
          style: appStyle(fw: FontWeight.bold, size: 13)
              .copyWith(color: Colors.white),
        ));
  }
}
