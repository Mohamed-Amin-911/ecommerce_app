import 'package:ecommerce_app_2/constants/color.dart';
import 'package:ecommerce_app_2/constants/size_config.dart';
import 'package:ecommerce_app_2/constants/text_style.dart';
import 'package:ecommerce_app_2/models/sneakers_class.dart';
import 'package:ecommerce_app_2/presentation/widgets/add_to_cart_button.dart';
import 'package:ecommerce_app_2/services/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive_flutter/adapters.dart';

import 'product_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final _cartBox = Hive.box("cart_box");

  List<dynamic> cart = [];

  _deleteFav(int key) async {
    await _cartBox.delete(key);
  }

  onGoBack() {
    setState(() {});
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
    final cartData = _cartBox.keys.map((key) {
      final item = _cartBox.get(key);

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

    cart = cartData.reversed.toList();

    return Scaffold(
      backgroundColor: Pallete.bg,
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40 * Sizeconfig.verticalBlock),
            //title
            Text("My Cart",
                style: appStyle(fw: FontWeight.bold, size: 36)
                    .copyWith(color: Colors.black)),
            SizedBox(height: 20 * Sizeconfig.verticalBlock),
            //list view
            SizedBox(
              height: 0.65 * Sizeconfig.screenHeight,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: ListView.builder(
                    itemCount: cart.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      final data = cart[index];

                      //cart item
                      return Padding(
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
                                              onTap: () {
                                                final male = snapshot1.data!;
                                                final women = snapshot2.data!;
                                                final kids = snapshot3.data!;
                                                final allProducts =
                                                    male + women + kids;
                                                final SneakerClass product;

                                                product = allProducts
                                                    .where((e) =>
                                                        e.id == data["id"])
                                                    .first;

                                                Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              ProductScreen(
                                                                  sneaker:
                                                                      product),
                                                        ))
                                                    .then(
                                                        (value) => onGoBack());
                                              },
                                              child: Container(
                                                height:
                                                    Sizeconfig.screenHeight *
                                                        0.11,
                                                width: Sizeconfig.screenWidth,
                                                decoration: BoxDecoration(
                                                    color: Colors.grey.shade100,
                                                    boxShadow: const [
                                                      BoxShadow(
                                                          spreadRadius: 1,
                                                          offset: Offset(0, 1),
                                                          blurRadius: 6,
                                                          color: Color.fromARGB(
                                                              42, 0, 0, 0))
                                                    ]),
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
                                                          child: Image.network(
                                                            data["image"],
                                                            height: 70 *
                                                                Sizeconfig
                                                                    .verticalBlock,
                                                            width: 70 *
                                                                Sizeconfig
                                                                    .horizontalBlock,
                                                            fit: BoxFit.fill,
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
                                                              Text(data["name"],
                                                                  style: appStyle(
                                                                          fw: FontWeight
                                                                              .bold,
                                                                          size:
                                                                              16)
                                                                      .copyWith(
                                                                          color:
                                                                              Colors.black)),
                                                              SizedBox(
                                                                  height: 5 *
                                                                      Sizeconfig
                                                                          .verticalBlock),
                                                              Text(
                                                                  data[
                                                                      "category"],
                                                                  style: appStyle(
                                                                          fw: FontWeight
                                                                              .w600,
                                                                          size:
                                                                              14)
                                                                      .copyWith(
                                                                          color:
                                                                              Colors.grey)),
                                                              SizedBox(
                                                                  height: 5 *
                                                                      Sizeconfig
                                                                          .verticalBlock),
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                      "\$${data["price"]}",
                                                                      style: appStyle(
                                                                              fw: FontWeight.w600,
                                                                              size: 18)
                                                                          .copyWith(color: Colors.black)),
                                                                  SizedBox(
                                                                      width: 20 *
                                                                          Sizeconfig
                                                                              .horizontalBlock),
                                                                  Text("size ",
                                                                      style: appStyle(
                                                                              fw: FontWeight.w600,
                                                                              size: 18)
                                                                          .copyWith(color: Colors.grey)),
                                                                  Text(
                                                                      data["sizes"]
                                                                          .toString(),
                                                                      style: appStyle(
                                                                              fw: FontWeight.w600,
                                                                              size: 18)
                                                                          .copyWith(color: Colors.grey)),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 12,
                                                              bottom: 12,
                                                              right: 12),
                                                      child: Column(
                                                        children: [
                                                          InkWell(
                                                            onTap: () {},
                                                            child: Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(2),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color:
                                                                    Colors.grey,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                              ),
                                                              child: const Icon(
                                                                  Icons.remove,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 15),
                                                            ),
                                                          ),
                                                          Text(
                                                              data['quantity']
                                                                  .toString(),
                                                              style: appStyle(
                                                                      fw: FontWeight
                                                                          .w600,
                                                                      size: 20)
                                                                  .copyWith(
                                                                      color: Colors
                                                                          .black)),
                                                          InkWell(
                                                            onTap: () {},
                                                            child: Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(2),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .black,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                              ),
                                                              child: const Icon(
                                                                  Icons.add,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 15),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )
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
                          ));
                    }),
              ),
            ),
            SizedBox(height: 25 * Sizeconfig.verticalBlock),
            //checkout button
            Align(
              alignment: Alignment.bottomCenter,
              child: AddToCartButton(ontap: () {}, label: "Checkout"),
            )
          ],
        ),
      ),
    );
  }
}
