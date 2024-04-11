import 'package:ecommerce_app_2/constants/color.dart';
import 'package:ecommerce_app_2/constants/size_config.dart';
import 'package:ecommerce_app_2/constants/text_style.dart';
import 'package:ecommerce_app_2/controllers/product_provider.dart';
import 'package:ecommerce_app_2/models/sneakers_class.dart';
import 'package:ecommerce_app_2/presentation/widgets/add_to_cart_button.dart';
import 'package:ecommerce_app_2/presentation/widgets/product_screen_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key, required this.sneaker});
  final SneakerClass sneaker;
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final pageController = PageController();

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
                  SizedBox(
                    height: Sizeconfig.screenHeight * 0.4,
                    width: Sizeconfig.screenWidth,
                    child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.sneaker.imageUrl.length,
                      controller: pageController,
                      onPageChanged: (value) {
                        Provider.of<ProductProvider>(context, listen: false)
                            .activePage = value;
                      },
                      itemBuilder: (context, index) {
                        //image
                        return Container(
                          margin: const EdgeInsetsDirectional.only(top: 50),
                          height: Sizeconfig.screenHeight * 0.1,
                          width: Sizeconfig.screenWidth,
                          color: Pallete.bg,
                          child: Image.network(
                            widget.sneaker.imageUrl[index],
                          ),
                        );
                      },
                    ),
                  ),
                  //favourite icon
                  Positioned(
                      top: Sizeconfig.screenHeight * 0.09,
                      right: 20,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite_border_rounded,
                            color: Colors.black,
                          ))),
                  //circle avatar display
                  Positioned(
                      top: Sizeconfig.screenHeight * 0.34,
                      right: 0,
                      left: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            widget.sneaker.imageUrl.length,
                            (index) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  child: CircleAvatar(
                                    radius: 5,
                                    backgroundColor:
                                        Provider.of<ProductProvider>(context)
                                                    .activePage !=
                                                index
                                            ? Colors.grey
                                            : Colors.black,
                                  ),
                                )),
                      )),

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
                                    blurRadius: 5,
                                    color: Colors.black,
                                    spreadRadius: 10,
                                    offset: Offset(0, -3))
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
                                    Text(widget.sneaker.name,
                                        style: appStyle(
                                                fw: FontWeight.bold, size: 40)
                                            .copyWith(color: Colors.black)),
                                    //category and rating
                                    Row(
                                      children: [
                                        //category
                                        Text(widget.sneaker.category,
                                            style: appStyle(
                                                    fw: FontWeight.w500,
                                                    size: 20)
                                                .copyWith(color: Colors.grey)),
                                        const Spacer(),
                                        //rating
                                        RatingBar.builder(
                                          initialRating: 4,
                                          allowHalfRating: true,
                                          minRating: 1,
                                          itemCount: 5,
                                          itemSize: 22,
                                          itemPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 1),
                                          direction: Axis.horizontal,
                                          itemBuilder: (context, index) =>
                                              const Icon(
                                            Icons.star_rate_rounded,
                                            size: 25,
                                            color: Colors.black,
                                          ),
                                          onRatingUpdate: (value) {},
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                        height: 20 * Sizeconfig.verticalBlock),
                                    //price and colors
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        //price
                                        Text("\$${widget.sneaker.price}",
                                            style: appStyle(
                                                    fw: FontWeight.w600,
                                                    size: 26)
                                                .copyWith(color: Colors.black)),
                                        //colors
                                        Row(
                                          children: [
                                            Text("Colors",
                                                style: appStyle(
                                                        fw: FontWeight.w500,
                                                        size: 18)
                                                    .copyWith(
                                                        color: Colors.black)),
                                            SizedBox(
                                                width: 5 *
                                                    Sizeconfig.horizontalBlock),
                                            const CircleAvatar(
                                              radius: 7,
                                              backgroundColor: Colors.black,
                                            ),
                                            SizedBox(
                                                width: 5 *
                                                    Sizeconfig.horizontalBlock),
                                            const CircleAvatar(
                                              radius: 7,
                                              backgroundColor: Colors.red,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                        height: 20 * Sizeconfig.verticalBlock),
                                    //sizes
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Select sizes",
                                            style: appStyle(
                                                    fw: FontWeight.w600,
                                                    size: 20)
                                                .copyWith(color: Colors.black)),
                                        SizedBox(
                                            height:
                                                10 * Sizeconfig.verticalBlock),
                                        SizedBox(
                                          height: 40 * Sizeconfig.verticalBlock,
                                          child: ListView.builder(
                                            padding: EdgeInsets.zero,
                                            scrollDirection: Axis.horizontal,
                                            itemCount:
                                                Provider.of<ProductProvider>(
                                                        context)
                                                    .shoeSizes
                                                    .length,
                                            itemBuilder: (context, index) {
                                              final shoeSizes =
                                                  Provider.of<ProductProvider>(
                                                          context)
                                                      .shoeSizes;
                                              return ChoiceChip(
                                                disabledColor:
                                                    const Color.fromARGB(
                                                        143, 158, 158, 158),
                                                shape: const CircleBorder(),
                                                backgroundColor:
                                                    shoeSizes[index]
                                                            ["isSelected"]
                                                        ? Colors.black
                                                        : const Color.fromARGB(
                                                            143, 158, 158, 158),
                                                label: Text(
                                                    "${shoeSizes[index]["size"]}",
                                                    style: appStyle(
                                                            fw: FontWeight.w500,
                                                            size: 15)
                                                        .copyWith(
                                                            color: shoeSizes[
                                                                        index][
                                                                    "isSelected"]
                                                                ? Colors.white
                                                                : Colors
                                                                    .black)),
                                                selected: shoeSizes[index]
                                                    ["isSelected"],
                                                side: BorderSide.none,
                                                showCheckmark: false,
                                                selectedColor: Colors.black,
                                                onSelected: (value) {
                                                  Provider.of<ProductProvider>(
                                                          context,
                                                          listen: false)
                                                      .toggleCheck(index);
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
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
                                    SizedBox(
                                      width: 0.8 * Sizeconfig.screenWidth,
                                      child: Text(
                                        widget.sneaker.title,
                                        style: appStyle(
                                                fw: FontWeight.bold, size: 19)
                                            .copyWith(color: Colors.black),
                                      ),
                                    ),
                                    //description
                                    Text(
                                      widget.sneaker.description,
                                      textAlign: TextAlign.justify,
                                      // maxLines: 5,
                                      style: appStyle(
                                              fw: FontWeight.normal, size: 14)
                                          .copyWith(color: Colors.black),
                                    ),
                                    SizedBox(
                                        height: 20 * Sizeconfig.verticalBlock),

                                    //add to cart button
                                    AddToCartButton(
                                      ontap: () {},
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
