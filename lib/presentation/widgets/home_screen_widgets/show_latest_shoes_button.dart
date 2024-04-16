import 'package:ecommerce_app_2/constants/text_style.dart';
import 'package:ecommerce_app_2/presentation/screens/product_by_cat.dart';
import 'package:flutter/material.dart';

class ShowLatestShoesbutton extends StatefulWidget {
  const ShowLatestShoesbutton({
    super.key,
    required this.initiallIndex,
  });
  final int initiallIndex;

  @override
  State<ShowLatestShoesbutton> createState() => _ShowLatestShoesbuttonState();
}

class _ShowLatestShoesbuttonState extends State<ShowLatestShoesbutton> {
  onGoBack() {
    setState(() {});
  }

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
                  initialIndex: widget.initiallIndex,
                ),
              )).then((value) => onGoBack());
        },
        child: Text(
          "show all",
          style: appStyle(fw: FontWeight.bold, size: 13)
              .copyWith(color: Colors.white),
        ));
  }
}
