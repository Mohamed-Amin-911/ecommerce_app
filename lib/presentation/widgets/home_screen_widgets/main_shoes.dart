import 'package:ecommerce_app_2/constants/size_config.dart';
import 'package:ecommerce_app_2/controllers/product_provider.dart';
import 'package:ecommerce_app_2/models/sneakers_class.dart';
import 'package:ecommerce_app_2/presentation/screens/product_screen.dart';
import 'package:ecommerce_app_2/presentation/widgets/home_screen_widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainShoesWidget extends StatefulWidget {
  const MainShoesWidget({
    super.key,
    required this.list,
  });

  final Future<List<SneakerClass>> list;

  @override
  State<MainShoesWidget> createState() => _MainShoesWidgetState();
}

class _MainShoesWidgetState extends State<MainShoesWidget> {
  @override
  void initState() {
    super.initState();
  }

  onGoBack() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizeconfig.designHeight * 0.45,
      child: FutureBuilder(
          future: widget.list,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text("Error ${snapshot.error}");
            } else {
              final shoes = snapshot.data!;

              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: shoes.length,
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
                      child: ProductCardWidget(
                        id: shoes.id,
                        category: shoes.category,
                        colors: const [Colors.black],
                        image: shoes.imageUrl[0],
                        name: shoes.name,
                        price: shoes.price,
                      ),
                    );
                  });
            }
          }),
    );
  }
}
