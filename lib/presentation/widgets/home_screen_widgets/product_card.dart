import 'package:ecommerce_app_2/constants/size_config.dart';
import 'package:ecommerce_app_2/constants/text_style.dart';
import 'package:ecommerce_app_2/models/constants.dart';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class ProductCardWidget extends StatefulWidget {
  const ProductCardWidget({
    super.key,
    required this.image,
    required this.name,
    required this.category,
    required this.price,
    required this.colors,
    required this.id,
  });
  final String image;
  final String name;
  final String category;
  final String price;
  final List<Color> colors;
  final String id;

  @override
  State<ProductCardWidget> createState() => _ProductCardWidgetState();
}

class _ProductCardWidgetState extends State<ProductCardWidget> {
  final _favBox = Hive.box("fav_box");

  Future<void> _createFav(Map<String, dynamic> addFav) async {
    await _favBox.add(addFav);
    getFavourites();
  }

  getFavourites() {
    final favData = _favBox.keys.map((key) {
      final item = _favBox.get(key);
      return {
        "key": key,
        "id": item["id"],
        // "name": item["name"],
        // "image": item["image"],
        // "price": item["price"],
      };
    }).toList();
    favors = favData.toList();
    ids = favors.map((e) => e["id"]).toList();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getFavourites();
  }

  _deleteFav(int key) async {
    await _favBox.delete(key);
    final favData = _favBox.keys.map((key) {
      final item = _favBox.get(key);
      return {
        "key": key,
        "id": item["id"],
        "category": item["category"],
        "name": item["name"],
        "image": item["image"],
        "price": item["price"],
        "quantity": item["quantity"],
        "sizes": item["sizes"],
      };
    }).toList();
    favors = favData.toList();
    ids = favors.map((e) => e["id"]).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final favData = _favBox.keys.map((key) {
    //   final item = _favBox.get(key);
    //   return {
    //     "key": key,
    //     "id": item["id"],
    //     "category": item["category"],
    //     "name": item["name"],
    //     "image": item["image"],
    //     "price": item["price"],
    //     "quantity": item["quantity"],
    //     "sizes": item["sizes"],
    //   };
    // }).toList();
    // final fav = favData.where((e) => e["id"] == widget.id);

    bool selected = true;
    return Stack(
      children: [
        //main container
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                    spreadRadius: 1,
                    offset: Offset(0, 1),
                    blurRadius: 6,
                    color: Color.fromARGB(42, 0, 0, 0))
              ]),
          margin: const EdgeInsets.all(8),
          height: Sizeconfig.designHeight,
          width: Sizeconfig.designWidth * 0.8,
        ),
        //image
        Positioned(
          top: -30,
          right: 0,
          left: 0,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 45),
            child: Image.network(
                width: Sizeconfig.designWidth * 0.6,
                fit: BoxFit.fill,
                widget.image),
          ),
        ),

        //data
        Positioned(
          top: 150,
          child: Container(
              margin: const EdgeInsets.only(left: 20),
              width: Sizeconfig.designWidth * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //title
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 80,
                        child: Text(
                          widget.name,
                          style: appStyle(fw: FontWeight.bold, size: 36)
                              .copyWith(color: Colors.black, height: 1.1),
                        ),
                      ),
                      SizedBox(height: 7 * Sizeconfig.verticalBlock),
                      //category
                      Text(
                        widget.category,
                        maxLines: 2,
                        style: appStyle(fw: FontWeight.bold, size: 17)
                            .copyWith(color: Colors.grey, height: 1.1),
                      ),
                    ],
                  ),

                  SizedBox(height: 7 * Sizeconfig.verticalBlock),
                  //price and colors
                  Row(
                    children: [
                      //price
                      Text(
                        "\$${widget.price}",
                        style: appStyle(fw: FontWeight.bold, size: 36)
                            .copyWith(color: Colors.black, height: 1.1),
                      ),
                      const Spacer(),
                      //colors
                      Text(
                        "Colors  ",
                        style: appStyle(fw: FontWeight.bold, size: 17)
                            .copyWith(color: Colors.grey, height: 1.1),
                      ),

                      //colors circle
                      SizedBox(
                        width: 30,
                        height: 20,
                        child: ChoiceChip(
                          label: const Text(""),
                          selected: selected,
                          shape: const CircleBorder(),
                          visualDensity: VisualDensity.compact,
                          color: const MaterialStatePropertyAll(Colors.black),
                        ),
                      )
                    ],
                  ),
                ],
              )),
        ),

        // favourite
        // Positioned(
        //     right: 20,
        //     top: 20,
        //     child: Icon(
        //       ids.contains(widget.id)
        //           ? Icons.favorite_rounded
        //           : Icons.favorite_border_rounded,
        //       color: Colors.black,
        //       size: 30,
        //     )),
      ],
    );
  }
}
