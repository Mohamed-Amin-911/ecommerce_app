import 'dart:async';

import 'package:ecommerce_app_2/constants/color.dart';
import 'package:ecommerce_app_2/constants/size_config.dart';
import 'package:ecommerce_app_2/constants/text_style.dart';
import 'package:ecommerce_app_2/models/sneakers_class.dart';
import 'package:ecommerce_app_2/presentation/screens/product_screen.dart';
import 'package:ecommerce_app_2/services/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive_flutter/adapters.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  final _favBox = Hive.box("fav_box");

  List<dynamic> fav = [];
  onGoBack() {
    setState(() {});
  }

  _deleteFav(int key) async {
    await _favBox.delete(key);
  }

  late Future<List<SneakerClass>> _male;
  late Future<List<SneakerClass>> _kids;
  late Future<List<SneakerClass>> _women;
  void getMale() {
    _male = Helper().getMaleSneakers();
  }

  void getWomen() {
    _women = Helper().getWomenSneakers();
  }

  void getKids() {
    _kids = Helper().getKidsSneakers();
  }

  @override
  void initState() {
    super.initState();
    getMale();
    getWomen();
    getKids();
  }

  @override
  Widget build(BuildContext context) {
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

    fav = favData.reversed.toList();

    return Scaffold(
      backgroundColor: Pallete.bg,
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40 * Sizeconfig.verticalBlock),
            //title
            Text("My Favourites",
                style: appStyle(fw: FontWeight.bold, size: 36)
                    .copyWith(color: Colors.black)),
            SizedBox(height: 20 * Sizeconfig.verticalBlock),
            //list view
            SizedBox(
              height: 0.70 * Sizeconfig.screenHeight,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: ListView.builder(
                    itemCount: fav.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      final data = fav[index];
                      //cart item
                      return fav.isEmpty
                          ? Center(
                              child: Text(
                              "Add some favourites",
                              style: appStyle(fw: FontWeight.bold, size: 30)
                                  .copyWith(color: Colors.black),
                            ))
                          : Padding(
                              padding: const EdgeInsets.all(8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Slidable(
                                    key: const ValueKey(0),
                                    endActionPane: ActionPane(
                                        motion: const ScrollMotion(),
                                        children: [
                                          SlidableAction(
                                            onPressed: (context) {
                                              _deleteFav(data["key"]);
                                              setState(() {});
                                            },
                                            flex: 1,
                                            backgroundColor: Colors.black,
                                            foregroundColor: Colors.white,
                                            icon: Icons.delete,
                                            label: "Delete",
                                          )
                                        ]),
                                    child: FutureBuilder(
                                      future: _male,
                                      builder: (context, snapshot1) {
                                        return FutureBuilder(
                                          future: _women,
                                          builder: (context, snapshot2) {
                                            return FutureBuilder(
                                              future: _kids,
                                              builder: (context, snapshot3) {
                                                return GestureDetector(
                                                  onTap: () async {
                                                    final male =
                                                        snapshot1.data!;
                                                    final women =
                                                        snapshot2.data!;
                                                    final kids =
                                                        snapshot3.data!;
                                                    final SneakerClass product;
                                                    if (data["category"] ==
                                                        "Men's Running") {
                                                      product = male
                                                          .where((e) =>
                                                              e.id ==
                                                              data["id"])
                                                          .first;
                                                    } else if (data[
                                                            "category"] ==
                                                        "Women's Running") {
                                                      product = women
                                                          .where((e) =>
                                                              e.id ==
                                                              data["id"])
                                                          .first;
                                                    } else {
                                                      product = kids
                                                          .where((e) =>
                                                              e.id ==
                                                              data["id"])
                                                          .first;
                                                    }
                                                    Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  ProductScreen(
                                                                      sneaker:
                                                                          product),
                                                            ))
                                                        .then((value) =>
                                                            onGoBack());
                                                  },
                                                  child: Container(
                                                    height: Sizeconfig
                                                            .screenHeight *
                                                        0.11,
                                                    width:
                                                        Sizeconfig.screenWidth,
                                                    decoration: BoxDecoration(
                                                      boxShadow: const [
                                                        BoxShadow(
                                                            spreadRadius: 1,
                                                            offset:
                                                                Offset(0, 2),
                                                            blurRadius: 6,
                                                            color:
                                                                Color.fromARGB(
                                                                    42,
                                                                    0,
                                                                    0,
                                                                    0))
                                                      ],
                                                      color:
                                                          Colors.grey.shade100,
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(12),
                                                              child:
                                                                  Image.network(
                                                                data["image"],
                                                                height: 70 *
                                                                    Sizeconfig
                                                                        .verticalBlock,
                                                                width: 70 *
                                                                    Sizeconfig
                                                                        .horizontalBlock,
                                                                fit:
                                                                    BoxFit.fill,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      top: 12,
                                                                      left: 20),
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                      data[
                                                                          "name"],
                                                                      style: appStyle(
                                                                              fw: FontWeight.bold,
                                                                              size: 16)
                                                                          .copyWith(color: Colors.black)),
                                                                  SizedBox(
                                                                      height: 5 *
                                                                          Sizeconfig
                                                                              .verticalBlock),
                                                                  Text(
                                                                      data[
                                                                          "category"],
                                                                      style: appStyle(
                                                                              fw: FontWeight.w600,
                                                                              size: 14)
                                                                          .copyWith(color: Colors.grey)),
                                                                  SizedBox(
                                                                      height: 5 *
                                                                          Sizeconfig
                                                                              .verticalBlock),
                                                                  Row(
                                                                    children: [
                                                                      Text(
                                                                          "\$${data["price"]}",
                                                                          style:
                                                                              appStyle(fw: FontWeight.w600, size: 18).copyWith(color: Colors.black)),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        );
                                      },
                                    )),
                              ),
                            );
                    }),
              ),
            ),
            SizedBox(height: 25 * Sizeconfig.verticalBlock),
          ],
        ),
      ),
    );
  }
}
