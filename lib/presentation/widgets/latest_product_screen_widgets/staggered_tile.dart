import 'package:ecommerce_app_2/constants/size_config.dart';
import 'package:ecommerce_app_2/constants/text_style.dart';
import 'package:ecommerce_app_2/controllers/product_provider.dart';
import 'package:ecommerce_app_2/models/sneakers_class.dart';
import 'package:ecommerce_app_2/presentation/screens/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StagggeredTile extends StatefulWidget {
  const StagggeredTile({super.key, required this.sneaker});
  final SneakerClass sneaker;
  @override
  State<StagggeredTile> createState() => _StagggeredTileState();
}

class _StagggeredTileState extends State<StagggeredTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<ProductProvider>(context, listen: false).shoeSizes =
            widget.sneaker.sizes;
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductScreen(sneaker: widget.sneaker)));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(widget.sneaker.imageUrl[0], fit: BoxFit.fill),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.sneaker.name,
                  style: appStyle(fw: FontWeight.bold, size: 23)
                      .copyWith(color: Colors.black, height: 1),
                ),
                SizedBox(height: 5 * Sizeconfig.verticalBlock),
                Text(
                  "\$${widget.sneaker.price}",
                  style: appStyle(fw: FontWeight.w500, size: 20)
                      .copyWith(color: Colors.black, height: 1),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
