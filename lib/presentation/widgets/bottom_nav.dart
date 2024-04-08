import 'package:community_material_icon/community_material_icon.dart';
import 'package:ecommerce_app_2/provider/tabs_screen_provider.dart';
import 'package:ecommerce_app_2/presentation/widgets/bottom_nav_item.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

class BottomNavWidget extends StatelessWidget {
  const BottomNavWidget({
    super.key,
    required this.pageIndex,
  });

  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BottomNavItemWidget(
            function: () {
              Provider.of<TabsScreenProvider>(context, listen: false)
                  .pageIndex = 0;
            },
            icon: pageIndex == 0
                ? CommunityMaterialIcons.home
                : CommunityMaterialIcons.home_outline),
        BottomNavItemWidget(
            function: () {
              Provider.of<TabsScreenProvider>(context, listen: false)
                  .pageIndex = 1;
            },
            icon: pageIndex == 1 ? Ionicons.search : Ionicons.search_outline),
        BottomNavItemWidget(
            function: () {
              Provider.of<TabsScreenProvider>(context, listen: false)
                  .pageIndex = 2;
            },
            icon: pageIndex == 2
                ? Ionicons.add_circle
                : Ionicons.add_circle_outline),
        BottomNavItemWidget(
            function: () {
              Provider.of<TabsScreenProvider>(context, listen: false)
                  .pageIndex = 3;
            },
            icon: pageIndex == 3 ? Ionicons.cart : Ionicons.cart_outline),
        BottomNavItemWidget(
            function: () {
              Provider.of<TabsScreenProvider>(context, listen: false)
                  .pageIndex = 4;
            },
            icon: pageIndex == 4 ? Ionicons.person : Ionicons.person_outline),
      ],
    );
  }
}
