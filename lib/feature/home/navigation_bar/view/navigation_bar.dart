import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/core/gen/assets.gen.dart';
import 'package:turkiye_yazilim_staj/feature/home/Home/view/home.dart';
import 'package:turkiye_yazilim_staj/feature/home/cart/view/cart_view.dart';
import 'package:turkiye_yazilim_staj/feature/home/favourite/view/favourite_view.dart';
import 'package:turkiye_yazilim_staj/feature/home/navigation_bar/viewmodel/navbar_view_model.dart';
import 'package:turkiye_yazilim_staj/feature/home/profile/profile/view/profile_view.dart';
import 'package:turkiye_yazilim_staj/product/widget/custom_appbar.dart';

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
          // ? her sayfada farklı bir appbar mı olacak yoksa hepsine burada tanımlayabilir miyiz? search screen kafamı karıştırdı
          backgroundColor: Colors.transparent,
          appBar: CustomAppBar(
            isTransparent: currentIndex != 3,
            isWhite: currentIndex == 1 || currentIndex == 2,
          ),
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
    const ProfileView(),
  ];

  Container _bottomNavigationBar() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          transform: GradientRotation(BorderSide.strokeAlignCenter),
          colors: [
            Color(0xFFDAC6B5),
            Color(0xFFb59376),
          ],
        ),
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
