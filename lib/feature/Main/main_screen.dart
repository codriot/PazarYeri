import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:turkiye_yazilim_staj/feature/cart/view/cart_view.dart';
import 'package:turkiye_yazilim_staj/feature/favourite/favourite_view.dart';
import 'package:turkiye_yazilim_staj/feature/home/view/home.dart';
import 'package:turkiye_yazilim_staj/feature/profile/profile/view/profile_view.dart';
import 'package:turkiye_yazilim_staj/product/widget/custom_appbar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/BackgroundImage.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(
          isTransparent: currentIndex != 3,
          isWhite: currentIndex == 1 || currentIndex == 2,
        ),
        body: children[currentIndex],
        bottomNavigationBar: _bottomNavigationBar(),
      ),
    );
  }

  int currentIndex = 0;
  final List<Widget> children = [
    const HomeView(),
    const CartView(),
    const FavouriteView(),
    const ProfileView(),
  ];

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Container _bottomNavigationBar() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          transform: GradientRotation(BorderSide.strokeAlignCenter),
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xFFDAC6B5),
            Color(0xFFb59376),
          ],
        ),
      ),
      child: CustomNavigationBar(
        iconSize: 30.0,
        currentIndex: currentIndex,
        onTap: onTabTapped,
        selectedColor: Colors.white,
        strokeColor: Colors.white12,
        unSelectedColor: Colors.white,
        backgroundColor: Colors.transparent,
        items: [
          CustomNavigationBarItem(
            icon: const Icon(Icons.home_filled),
          ),
          CustomNavigationBarItem(
            icon: const Icon(Icons.shopping_cart),
          ),
          CustomNavigationBarItem(
            icon: const Icon((Icons.favorite)),
          ),
          CustomNavigationBarItem(
            icon: const Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
