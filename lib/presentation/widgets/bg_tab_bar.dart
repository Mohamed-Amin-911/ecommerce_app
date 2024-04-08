import 'package:ecommerce_app_2/constants/color.dart';
import 'package:ecommerce_app_2/constants/image_assets.dart';
import 'package:ecommerce_app_2/constants/size_config.dart';
import 'package:ecommerce_app_2/presentation/widgets/tab_bar.dart';
import 'package:flutter/material.dart';

class BgAndTabBarWidget extends StatelessWidget {
  const BgAndTabBarWidget({
    super.key,
    required TabController tabController,
    required this.filter,
  }) : _tabController = tabController;

  final TabController _tabController;
  final Function() filter;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 30, 0, 0),
      height: Sizeconfig.designHeight * 0.45,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ImageAsset.topImage), fit: BoxFit.fill)),
      child: Container(
        width: Sizeconfig.screenWidth,
        padding: const EdgeInsets.only(left: 6, top: 12, right: 16, bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close, color: Pallete.bg)),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      filter();
                    },
                    icon: const Icon(Icons.filter_list, color: Pallete.bg)),
              ],
            ),
            SizedBox(height: 20 * Sizeconfig.verticalBlock),
            TabBartWidget(tabController: _tabController),
          ],
        ),
      ),
    );
  }
}
