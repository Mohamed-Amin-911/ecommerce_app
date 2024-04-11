import 'package:ecommerce_app_2/constants/size_config.dart';
import 'package:ecommerce_app_2/models/sneakers_class.dart';
import 'package:ecommerce_app_2/presentation/screens/product_screen.dart';
import 'package:ecommerce_app_2/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';

class MainShoesWidget extends StatelessWidget {
  const MainShoesWidget({
    super.key,
    required this.list,
  });

  final Future<List<SneakerClass>> list;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizeconfig.designHeight * 0.45,
      child: FutureBuilder(
          future: list,
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ProductScreen(sneaker: shoes)));
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
