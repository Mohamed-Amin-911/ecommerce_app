import 'package:ecommerce_app_2/constants/text_style.dart';
import 'package:ecommerce_app_2/models/sneakers_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CategoryAndRatingWidget extends StatelessWidget {
  const CategoryAndRatingWidget({
    super.key,
    required this.sneaker,
  });

  final SneakerClass sneaker;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //category
        Text(sneaker.category,
            style: appStyle(fw: FontWeight.w500, size: 20)
                .copyWith(color: Colors.grey)),
        const Spacer(),
        //rating
        RatingBar.builder(
          initialRating: 4,
          allowHalfRating: true,
          minRating: 1,
          itemCount: 5,
          itemSize: 22,
          itemPadding: const EdgeInsets.symmetric(horizontal: 1),
          direction: Axis.horizontal,
          itemBuilder: (context, index) => const Icon(
            Icons.star_rate_rounded,
            size: 25,
            color: Colors.black,
          ),
          onRatingUpdate: (value) {},
        ),
      ],
    );
  }
}
