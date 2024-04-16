import 'package:ecommerce_app_2/constants/color.dart';
import 'package:ecommerce_app_2/constants/size_config.dart';
import 'package:ecommerce_app_2/constants/text_style.dart';
import 'package:ecommerce_app_2/models/sneakers_class.dart';
import 'package:ecommerce_app_2/presentation/widgets/latest_product_screen_widgets/bg_tab_bar.dart';
import 'package:ecommerce_app_2/presentation/widgets/category_button.dart';
import 'package:ecommerce_app_2/presentation/widgets/custom_spacer.dart';
import 'package:ecommerce_app_2/presentation/widgets/latest_product_screen_widgets/staggered_gridview_display.dart';
import 'package:ecommerce_app_2/services/helper.dart';
import 'package:flutter/material.dart';

class ProductByCatScreen extends StatefulWidget {
  const ProductByCatScreen({super.key, required this.initialIndex});
  final int initialIndex;
  @override
  State<ProductByCatScreen> createState() => _ProductByCatScreenState();
}

class _ProductByCatScreenState extends State<ProductByCatScreen>
    with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this, initialIndex: widget.initialIndex);

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

  List<String> brands = [
    "assets/images/adidas.png",
    "assets/images/gucci.png",
    "assets/images/nike.png",
    "assets/images/jordan.png",
  ];

  Future<dynamic> filter() {
    double _value = 100;
    return showModalBottomSheet(
      useRootNavigator: true,
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      elevation: 0.5,
      barrierColor: Colors.white54,
      builder: (context) => Container(
        height: Sizeconfig.designHeight * 0.9,
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 10 * Sizeconfig.verticalBlock),
              Container(
                height: 5 * Sizeconfig.verticalBlock,
                width: 40 * Sizeconfig.horizontalBlock,
                decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(10)),
              ),
              SizedBox(
                height: 10 * Sizeconfig.designHeight * 0.7,
                child: Column(
                  children: [
                    const CustomSpacer(),
                    Text(
                      "Filter",
                      style: appStyle(fw: FontWeight.bold, size: 40)
                          .copyWith(color: Colors.black),
                    ),
                    const CustomSpacer(),
                    Text(
                      "Gender",
                      style: appStyle(fw: FontWeight.bold, size: 20)
                          .copyWith(color: Colors.black45),
                    ),
                    SizedBox(height: 10 * Sizeconfig.verticalBlock),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CategoryButton(label: "Men", btnColor: Colors.black),
                        CategoryButton(label: "Women", btnColor: Colors.grey),
                        CategoryButton(label: "Kids", btnColor: Colors.grey),
                      ],
                    ),
                    const CustomSpacer(),
                    Text(
                      "Category",
                      style: appStyle(fw: FontWeight.bold, size: 20)
                          .copyWith(color: Colors.black45),
                    ),
                    SizedBox(height: 10 * Sizeconfig.verticalBlock),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CategoryButton(label: "Shoes", btnColor: Colors.black),
                        CategoryButton(
                            label: "Apparels", btnColor: Colors.grey),
                        CategoryButton(
                            label: "Accesories", btnColor: Colors.grey),
                      ],
                    ),
                    const CustomSpacer(),
                    Text(
                      "Price",
                      style: appStyle(fw: FontWeight.bold, size: 20)
                          .copyWith(color: Colors.black45),
                    ),
                    SizedBox(height: 5 * Sizeconfig.verticalBlock),
                    Slider(
                      value: _value,
                      activeColor: Colors.black,
                      inactiveColor: Colors.grey,
                      thumbColor: Colors.black,
                      max: 500,
                      divisions: 50,
                      label: "\$$_value",

                      // secondaryTrackValue: 200,
                      onChanged: (double value) {},
                    ),
                    const CustomSpacer(),
                    Text(
                      "Brands",
                      style: appStyle(fw: FontWeight.bold, size: 20)
                          .copyWith(color: Colors.black45),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      height: 80 * Sizeconfig.verticalBlock,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: brands.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.black, width: 2),
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Image.asset(
                                brands[index],
                                height: 60 * Sizeconfig.verticalBlock,
                                width: 80 * Sizeconfig.horizontalBlock,
                                color: Colors.black,
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: Pallete.bg,
      body: SizedBox(
        height: Sizeconfig.screenHeight,
        child: Stack(
          children: [
            BgAndTabBarWidget(
              tabController: _tabController,
              filter: filter,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: Sizeconfig.designHeight * 0.24, left: 16, right: 12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: TabBarView(
                    controller: _tabController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      StaggeredGridViewDisplayWidget(list: _male),
                      StaggeredGridViewDisplayWidget(list: _women),
                      StaggeredGridViewDisplayWidget(list: _kids),
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
