import 'package:ecommerce_app_2/constants/text_style.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Search",
          style: appStyle(fw: FontWeight.w300, size: 30),
        ),
      ),
    );
  }
}
