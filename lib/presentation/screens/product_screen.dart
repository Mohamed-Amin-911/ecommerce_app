import 'package:ecommerce_app_2/constants/color.dart';
import 'package:ecommerce_app_2/constants/size_config.dart';
import 'package:ecommerce_app_2/controllers/product_provider.dart';
import 'package:ecommerce_app_2/models/sneakers_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
            expandedHeight: Sizeconfig.screenHeight * 1,
            title: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Provider.of<ProductProvider>(context, listen: false)
                            .activePage = 0;
                      },
                      icon: const Icon(Icons.close, color: Colors.black)),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_horiz_rounded,
                          color: Colors.black)),
                ],
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  SizedBox(
                    height: Sizeconfig.screenHeight * 0.5,
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
                        return Stack(
                          children: [
                            Container(
                              height: Sizeconfig.screenHeight * 0.39,
                              width: Sizeconfig.screenWidth,
                              color: Pallete.bg,
                              child: Image.network(
                                  widget.sneaker.imageUrl[index],
                                  fit: BoxFit.contain),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Positioned(
                      top: Sizeconfig.screenHeight * 0.09,
                      right: 20,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite_border_rounded,
                            color: Colors.black,
                          ))),
                  Positioned(
                      top: Sizeconfig.screenHeight * 0.33,
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
                  Positioned(
                      bottom: 30,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                        child: Container(
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
