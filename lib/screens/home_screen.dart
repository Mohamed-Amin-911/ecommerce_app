import 'package:ecommerce_app_2/constants/color.dart';
import 'package:ecommerce_app_2/constants/size_config.dart';
import 'package:ecommerce_app_2/constants/text_style.dart';
import 'package:ecommerce_app_2/widgets/latest_product_card.dart';
import 'package:ecommerce_app_2/widgets/product_card.dart';
import 'package:ecommerce_app_2/widgets/title_&_tabbar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);

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
                Column(
                  children: [
                    //main product
                    SizedBox(
                      height: Sizeconfig.designHeight * 0.45,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            return const ProductCardWidget(
                              category: "Men's Running",
                              colors: [Colors.black],
                              image:
                                  "https://d326fntlu7tb1e.cloudfront.net/uploads/d60aca33-909b-4df7-9ad7-b75039438e29-GX1398_a1.webp",
                              name: "Ultra Boost Shoes",
                              price: "79.00",
                            );
                          }),
                    ),
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
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.arrow_right_rounded,
                                  size: 35,
                                ))
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Sizeconfig.designHeight * 0.2,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            return const LatestProductWidget(
                              image:
                                  "https://d326fntlu7tb1e.cloudfront.net/uploads/710d020f-2da8-4e9e-8cff-0c8f24581488-GV6674.webp",
                            );
                          }),
                    )
                  ],
                ),
                Column(
                  children: [
                    //main product
                    SizedBox(
                      height: Sizeconfig.designHeight * 0.45,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            return const ProductCardWidget(
                              category: "Men's Running",
                              colors: [Colors.black],
                              image:
                                  "https://d326fntlu7tb1e.cloudfront.net/uploads/d60aca33-909b-4df7-9ad7-b75039438e29-GX1398_a1.webp",
                              name: "Ultra Boost Shoes",
                              price: "79.00",
                            );
                          }),
                    ),
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
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.arrow_right_rounded,
                                  size: 35,
                                ))
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Sizeconfig.designHeight * 0.2,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            return const LatestProductWidget(
                              image:
                                  "https://d326fntlu7tb1e.cloudfront.net/uploads/710d020f-2da8-4e9e-8cff-0c8f24581488-GV6674.webp",
                            );
                          }),
                    )
                  ],
                ),
                Column(
                  children: [
                    //main product
                    SizedBox(
                      height: Sizeconfig.designHeight * 0.45,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            return const ProductCardWidget(
                              category: "Men's Running",
                              colors: [Colors.black],
                              image:
                                  "https://d326fntlu7tb1e.cloudfront.net/uploads/d60aca33-909b-4df7-9ad7-b75039438e29-GX1398_a1.webp",
                              name: "Ultra Boost Shoes",
                              price: "79.00",
                            );
                          }),
                    ),
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
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.arrow_right_rounded,
                                  size: 35,
                                ))
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Sizeconfig.designHeight * 0.2,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            return const LatestProductWidget(
                              image:
                                  "https://d326fntlu7tb1e.cloudfront.net/uploads/710d020f-2da8-4e9e-8cff-0c8f24581488-GV6674.webp",
                            );
                          }),
                    )
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
