import 'package:ecommerce_app_2/controllers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductPageTitle extends StatelessWidget {
  const ProductPageTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
                Provider.of<ProductProvider>(context, listen: false)
                    .activePage = 0;
                Provider.of<ProductProvider>(context, listen: false)
                    .unToggleCheck();
              },
              icon: const Icon(Icons.close, color: Colors.black)),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_horiz_rounded, color: Colors.black)),
        ],
      ),
    );
  }
}
