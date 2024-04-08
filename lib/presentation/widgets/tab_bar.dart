import 'package:ecommerce_app_2/constants/text_style.dart';
import 'package:flutter/material.dart';

class TabBartWidget extends StatelessWidget {
  const TabBartWidget({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: _tabController,
      tabAlignment: TabAlignment.start,
      labelPadding: const EdgeInsets.only(right: 45),
      dividerHeight: 0,
      labelStyle:
          appStyle(fw: FontWeight.bold, size: 18).copyWith(color: Colors.white),
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
    );
  }
}
