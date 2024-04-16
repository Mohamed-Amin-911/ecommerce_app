import 'package:ecommerce_app_2/constants/color.dart';
import 'package:ecommerce_app_2/constants/size_config.dart';
import 'package:ecommerce_app_2/controllers/product_provider.dart';
import 'package:ecommerce_app_2/models/constants.dart';
import 'package:ecommerce_app_2/models/sneakers_class.dart';
import 'package:ecommerce_app_2/presentation/screens/favourites_Screen.dart';
import 'package:ecommerce_app_2/presentation/widgets/add_to_cart_button.dart';
import 'package:ecommerce_app_2/presentation/widgets/product_screen_widgets/product_screen_title.dart';
import 'package:ecommerce_app_2/presentation/widgets/product_screen_widgets/category_rating.dart';
import 'package:ecommerce_app_2/presentation/widgets/product_screen_widgets/circle_avatar.dart';
import 'package:ecommerce_app_2/presentation/widgets/product_screen_widgets/descrition_widget.dart';
import 'package:ecommerce_app_2/presentation/widgets/product_screen_widgets/image_display.dart';
import 'package:ecommerce_app_2/presentation/widgets/product_screen_widgets/name.dart';
import 'package:ecommerce_app_2/presentation/widgets/product_screen_widgets/prices_color.dart';
import 'package:ecommerce_app_2/presentation/widgets/product_screen_widgets/sizes_widget.dart';
import 'package:ecommerce_app_2/presentation/widgets/product_screen_widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({super.key, required this.sneaker});
  final SneakerClass sneaker;
  final pageController = PageController();
  final _cartBox = Hive.box("cart_box");
  Future<void> _createCart(Map<String, dynamic> newCart) async {
    await _cartBox.add(newCart);
  }

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
      };
    }).toList();
    favors = favData.toList();
    ids = favors.map((e) => e["id"]).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.bg,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            leadingWidth: 0,
            pinned: true,
            snap: false,
            floating: true,
            backgroundColor: Colors.transparent,
            expandedHeight: Sizeconfig.screenHeight,
            title: const ProductPageTitle(),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  //image display
                  ImageDisplayWidget(
                      sneaker: sneaker, pageController: pageController),
                  //favourite icon
                  Positioned(
                      top: Sizeconfig.screenHeight * 0.09,
                      right: 20,
                      child: IconButton(
                          onPressed: () async {
                            if (ids.contains(sneaker.id)) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const FavouritesScreen(),
                                  ));
                            } else {
                              await _createFav({
                                "id": sneaker.id,
                                "name": sneaker.name,
                                "image": sneaker.imageUrl[0],
                                "price": sneaker.price,
                              });
                            }
                          },
                          icon: ids.contains(sneaker.id)
                              ? const Icon(
                                  Icons.favorite_rounded,
                                  color: Colors.black,
                                )
                              : const Icon(
                                  Icons.favorite_border_rounded,
                                  color: Colors.black,
                                ))),
                  //circle avatar display
                  CircleAvatarWidget(sneaker: sneaker),

                  // info container
                  Positioned(
                      bottom: 30,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 1,
                                    offset: Offset(0, 2),
                                    blurRadius: 6,
                                    color: Color.fromARGB(42, 0, 0, 0))
                              ]),
                          height: Sizeconfig.screenHeight * 0.645,
                          width: Sizeconfig.screenWidth,
                          //info column
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30)),
                            child: SingleChildScrollView(
                              child: SizedBox(
                                width: Sizeconfig.screenWidth,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //name
                                    NameWidget(sneaker: sneaker),
                                    //category and rating
                                    CategoryAndRatingWidget(sneaker: sneaker),
                                    SizedBox(
                                        height: 20 * Sizeconfig.verticalBlock),
                                    //price and colors
                                    PriceAndColorsWidget(sneaker: sneaker),
                                    SizedBox(
                                        height: 20 * Sizeconfig.verticalBlock),
                                    //sizes
                                    const SizesWidget(),
                                    SizedBox(
                                        height: 10 * Sizeconfig.verticalBlock),
                                    const Divider(
                                      indent: 10,
                                      endIndent: 10,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(
                                        height: 10 * Sizeconfig.verticalBlock),

                                    //title
                                    TitleWidget(sneaker: sneaker),
                                    //description
                                    DescriptionWidget(sneaker: sneaker),
                                    SizedBox(
                                        height: 20 * Sizeconfig.verticalBlock),

                                    //add to cart button
                                    AddToCartButton(
                                      ontap: () async {
                                        _createCart({
                                          "id": sneaker.id,
                                          "name": sneaker.name,
                                          "price": sneaker.price,
                                          "image": sneaker.imageUrl[0],
                                          "quantity": 1,
                                          "category": sneaker.category,
                                          "sizes": Provider.of<ProductProvider>(
                                                  context,
                                                  listen: false)
                                              .sizes
                                              .last
                                        });
                                        Provider.of<ProductProvider>(context,
                                                listen: false)
                                            .unToggleCheck();

                                        Navigator.pop(context);
                                      },
                                      label: "Add To Cart",
                                    ),
                                    SizedBox(
                                        height: 20 * Sizeconfig.verticalBlock),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
