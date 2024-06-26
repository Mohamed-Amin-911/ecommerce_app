import 'package:ecommerce_app_2/constants/size_config.dart';
import 'package:ecommerce_app_2/controllers/product_provider.dart';
import 'package:ecommerce_app_2/models/sneakers_class.dart';
import 'package:ecommerce_app_2/presentation/screens/product_screen.dart';
import 'package:ecommerce_app_2/presentation/widgets/home_screen_widgets/latest_product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LatestShoesWidget extends StatefulWidget {
  const LatestShoesWidget({
    super.key,
    required this.list,
  });

  final Future<List<SneakerClass>> list;

  @override
  State<LatestShoesWidget> createState() => _LatestShoesWidgetState();
}

class _LatestShoesWidgetState extends State<LatestShoesWidget> {
  onGoBack() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizeconfig.designHeight * 0.2,
      child: FutureBuilder(
        future: widget.list,
        builder: (context, snapshot) {
          final shoes = snapshot.data;
          return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: shoes!.length,
              itemBuilder: (context, index) {
                final shoes = snapshot.data![index];
                return GestureDetector(
                  onTap: () {
                    Provider.of<ProductProvider>(context, listen: false)
                        .sizes
                        .clear();
                    Provider.of<ProductProvider>(context, listen: false)
                        .shoeSizes = shoes.sizes;
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ProductScreen(sneaker: shoes)))
                        .then((value) => onGoBack());
                  },
                  child: LatestProductWidget(
                    image: shoes.imageUrl[1],
                  ),
                );
              });
        },
      ),
    );
  }
}
