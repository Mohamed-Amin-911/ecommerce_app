import 'package:ecommerce_app_2/constants/color.dart';
import 'package:ecommerce_app_2/constants/size_config.dart';
import 'package:ecommerce_app_2/constants/text_style.dart';
import 'package:ecommerce_app_2/models/sneakers_class.dart';
import 'package:ecommerce_app_2/presentation/screens/product_screen.dart';
import 'package:ecommerce_app_2/services/helper.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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

  List<SneakerClass> searchedProducts = [];

  onGoBack() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: false,
        backgroundColor: Pallete.bg,
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40 * Sizeconfig.verticalBlock),

              //textfield
              FutureBuilder(
                future: _male,
                builder: (context, snapshot1) => FutureBuilder(
                  future: _women,
                  builder: (context, snapshot2) => FutureBuilder(
                    future: _kids,
                    builder: (context, snapshot3) {
                      final male = snapshot1.data!;
                      final women = snapshot2.data!;
                      final kids = snapshot3.data!;

                      final allProducts = male + women + kids;

                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: TextField(
                          cursorColor: Colors.white,
                          cursorHeight: 25,
                          style: const TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                          decoration: const InputDecoration(
                            hintText: "Search for products...",
                            hintStyle: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(84, 255, 255, 255)),
                            filled: true,
                            fillColor: Color.fromARGB(255, 55, 55, 55),
                            border: InputBorder.none,
                          ),
                          onChanged: (value) {
                            searchedProducts = allProducts
                                .where((character) => character.name
                                    .toLowerCase()
                                    .startsWith(value))
                                .toList();

                            if (value == "") {
                              searchedProducts = [];
                            }
                            setState(() {});
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 10 * Sizeconfig.verticalBlock),

              //listview
              SizedBox(
                height: 0.76 * Sizeconfig.screenHeight,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: ListView.builder(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: searchedProducts.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: GestureDetector(
                            onTap: () async {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductScreen(
                                        sneaker: searchedProducts[index]),
                                  )).then((value) => onGoBack());
                            },
                            child: Container(
                              height: Sizeconfig.screenHeight * 0.11,
                              width: Sizeconfig.screenWidth,
                              decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                      spreadRadius: 1,
                                      offset: Offset(0, 2),
                                      blurRadius: 6,
                                      color: Color.fromARGB(42, 0, 0, 0))
                                ],
                                color: Colors.grey.shade100,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: Image.network(
                                          searchedProducts[index].imageUrl[0],
                                          height: 70 * Sizeconfig.verticalBlock,
                                          width:
                                              70 * Sizeconfig.horizontalBlock,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 12, left: 20),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(searchedProducts[index].name,
                                                style: appStyle(
                                                        fw: FontWeight.bold,
                                                        size: 16)
                                                    .copyWith(
                                                        color: Colors.black)),
                                            SizedBox(
                                                height: 5 *
                                                    Sizeconfig.verticalBlock),
                                            Text(
                                                searchedProducts[index]
                                                    .category,
                                                style: appStyle(
                                                        fw: FontWeight.w600,
                                                        size: 14)
                                                    .copyWith(
                                                        color: Colors.grey)),
                                            SizedBox(
                                                height: 5 *
                                                    Sizeconfig.verticalBlock),
                                            Row(
                                              children: [
                                                Text(
                                                    "\$${searchedProducts[index].price}",
                                                    style: appStyle(
                                                            fw: FontWeight.w600,
                                                            size: 18)
                                                        .copyWith(
                                                            color:
                                                                Colors.black)),
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
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
