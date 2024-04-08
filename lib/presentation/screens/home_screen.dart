import 'package:ecommerce_app_2/constants/color.dart';
import 'package:ecommerce_app_2/constants/size_config.dart';
import 'package:ecommerce_app_2/constants/text_style.dart';
import 'package:ecommerce_app_2/models/sneakers_class.dart';
import 'package:ecommerce_app_2/presentation/screens/product_by_cat.dart';
import 'package:ecommerce_app_2/services/helper.dart';
import 'package:ecommerce_app_2/presentation/widgets/latest_shoes.dart';
import 'package:ecommerce_app_2/presentation/widgets/main_shoes.dart';
import 'package:ecommerce_app_2/presentation/widgets/title_&_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);
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
    return Scaffold(
      backgroundColor: Pallete.bg,
      body: SizedBox(
        height: Sizeconfig.screenHeight,
        child: Stack(
          children: [
            TitleAndTabBarWidget(tabController: _tabController),
            Padding(
              padding: const EdgeInsets.only(
                  top: Sizeconfig.designHeight * 0.35, left: 10),
              child: TabBarView(controller: _tabController, children: [
                //men
                Column(
                  children: [
                    //main product
                    MainShoesWidget(list: _male),
                    SizedBox(height: 5 * Sizeconfig.verticalBlock),
                    //latest shoes
                    Row(
                      children: [
                        Text(
                          " Latest shoes",
                          style: appStyle(fw: FontWeight.bold, size: 24)
                              .copyWith(color: Colors.black),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Text(
                              "show all",
                              style: appStyle(fw: FontWeight.bold, size: 15)
                                  .copyWith(color: Colors.grey),
                            ),
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ProductByCatScreen(
                                                initialIndex: 0),
                                      ));
                                },
                                icon: const Icon(
                                  Icons.arrow_right_rounded,
                                  size: 35,
                                ))
                          ],
                        ),
                      ],
                    ),
                    LatestShoesWidget(list: _male)
                  ],
                ),
                //women
                Column(
                  children: [
                    //main product
                    MainShoesWidget(list: _women),
                    SizedBox(height: 5 * Sizeconfig.verticalBlock),
                    //latest shoes
                    Row(
                      children: [
                        Text(
                          " Latest shoes",
                          style: appStyle(fw: FontWeight.bold, size: 24)
                              .copyWith(color: Colors.black),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Text(
                              "show all",
                              style: appStyle(fw: FontWeight.bold, size: 15)
                                  .copyWith(color: Colors.grey),
                            ),
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ProductByCatScreen(
                                                initialIndex: 1),
                                      ));
                                },
                                icon: const Icon(
                                  Icons.arrow_right_rounded,
                                  size: 35,
                                ))
                          ],
                        ),
                      ],
                    ),
                    LatestShoesWidget(list: _women)
                  ],
                ),

                //kids
                Column(
                  children: [
                    //main product
                    MainShoesWidget(list: _kids),
                    SizedBox(height: 5 * Sizeconfig.verticalBlock),
                    //latest shoes
                    Row(
                      children: [
                        Text(
                          " Latest shoes",
                          style: appStyle(fw: FontWeight.bold, size: 24)
                              .copyWith(color: Colors.black),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Text(
                              "show all",
                              style: appStyle(fw: FontWeight.bold, size: 15)
                                  .copyWith(color: Colors.grey),
                            ),
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ProductByCatScreen(
                                                initialIndex: 2),
                                      ));
                                },
                                icon: const Icon(
                                  Icons.arrow_right_rounded,
                                  size: 35,
                                ))
                          ],
                        ),
                      ],
                    ),
                    LatestShoesWidget(list: _kids)
                  ],
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
