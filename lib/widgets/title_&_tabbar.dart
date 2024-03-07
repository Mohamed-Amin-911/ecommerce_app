import 'package:ecommerce_app_2/constants/image_assets.dart';
import 'package:ecommerce_app_2/constants/size_config.dart';
import 'package:ecommerce_app_2/constants/text_style.dart';
import 'package:flutter/material.dart';

class TitleAndTabBarWidget extends StatelessWidget {
  const TitleAndTabBarWidget({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 45, 0, 0),
      height: Sizeconfig.designHeight * 0.45,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ImageAsset.topImage), fit: BoxFit.fill)),
      child: Container(
        width: Sizeconfig.screenWidth,
        padding: const EdgeInsets.only(left: 8, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Athletic Shoes
            Text(
              "Athletic Shoes",
              style: appStyle(fw: FontWeight.bold, size: 42)
                  .copyWith(color: Colors.white, height: 1.5),
            ),
            //Collections
            Text(
              "Collections",
              style: appStyle(fw: FontWeight.bold, size: 42)
                  .copyWith(color: Colors.white, height: 1.2),
            ),
            SizedBox(height: 20 * Sizeconfig.verticalBlock),
            TabBar(
              controller: _tabController,
              tabAlignment: TabAlignment.start,
              labelPadding: const EdgeInsets.only(right: 45),
              dividerHeight: 0,
              labelStyle: appStyle(fw: FontWeight.bold, size: 18)
                  .copyWith(color: Colors.white),
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 1,
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              tabs: const <Widget>[
                Tab(
                  text: "Men shoes",
                ),
                Tab(
                  text: "Women shoes",
                ),
                Tab(
                  text: "Kids shoes",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
