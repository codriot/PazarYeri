import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/core/gen/assets.gen.dart';
import 'package:turkiye_yazilim_staj/feature/home/Home/view/home.dart';
import 'package:turkiye_yazilim_staj/feature/home/cart/cart/view/cart_view.dart';
import 'package:turkiye_yazilim_staj/feature/home/favourite/view/favourite_view.dart';
import 'package:turkiye_yazilim_staj/feature/home/navigation_bar/viewmodel/navbar_view_model.dart';
import 'package:turkiye_yazilim_staj/feature/home/navigation_bar/viewmodel/navigator.dart';
import 'package:turkiye_yazilim_staj/product/util/mixin/custom_gradient.dart';

class NavbarView extends StatefulWidget {
  const NavbarView({super.key});

  @override
  State<NavbarView> createState() => _NavbarViewState();
}

class _NavbarViewState extends State<NavbarView> {
  final controller = Get.put(NavBarController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.images.backgroundImage.path),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: IndexedStack(
            index: currentIndex,
            children: children,
          ),
          bottomNavigationBar: _bottomNavigationBar(),
        ),
      ),
    );
  }

  int get currentIndex => controller.tabIndex.value;
  final List<Widget> children = [
    const HomeView(),
    const CartView(),
    const FavoriteView(),
    const Wishlist(),
  ];

  Container _bottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        gradient: CustomGradient.bottomNavBarGradient(),
      ),
      child: CustomNavigationBar(
        iconSize: 30,
        currentIndex: currentIndex,
        onTap: controller.changeTabIndex,
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
            icon: const Icon(Icons.favorite),
          ),
          CustomNavigationBarItem(
            icon: const Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
