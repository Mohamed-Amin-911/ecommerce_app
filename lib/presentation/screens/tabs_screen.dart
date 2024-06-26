import 'package:ecommerce_app_2/constants/color.dart';
import 'package:ecommerce_app_2/constants/size_config.dart';
import 'package:ecommerce_app_2/controllers/tabs_screen_provider.dart';
import 'package:ecommerce_app_2/presentation/screens/cart_screen.dart';
import 'package:ecommerce_app_2/presentation/screens/favourites_screen.dart';
import 'package:ecommerce_app_2/presentation/screens/home_screen.dart';
import 'package:ecommerce_app_2/presentation/screens/profile_screen.dart';
import 'package:ecommerce_app_2/presentation/screens/search_Screen.dart';
import 'package:ecommerce_app_2/presentation/widgets/tabs_screen_wdgets/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  final List<Widget> pages = const [
    HomeScreen(),
    SearchScreen(),
    FavouritesScreen(),
    CartScreen(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    int pageIndex = Provider.of<TabsScreenProvider>(context).pageIndex;
    Sizeconfig().init(context);
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: Pallete.bg,
      body: pages[pageIndex],
      bottomNavigationBar: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(boxShadow: const [
            BoxShadow(
                spreadRadius: 1,
                offset: Offset(0, 1),
                blurRadius: 6,
                color: Color.fromARGB(42, 0, 0, 0))
          ], color: Colors.black, borderRadius: BorderRadius.circular(16)),
          child: BottomNavWidget(pageIndex: pageIndex),
        ),
      )),
    );
  }
}
