import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/feature/Home/view/home.dart';
import 'package:turkiye_yazilim_staj/feature/cart/cart/view/cart_view.dart';
import 'package:turkiye_yazilim_staj/feature/favourite/view/favourite_view.dart';
import 'package:turkiye_yazilim_staj/feature/navigation_bar/controller/navigation_bar_controller.dart';
import 'package:turkiye_yazilim_staj/product/utility/page_util/navigate_profile_utility.dart';
import 'package:turkiye_yazilim_staj/product/widget/custom_bottom_navigation_bar.dart';

class NavigationBarView extends StatefulWidget {
  const NavigationBarView({super.key});

  @override
  State<NavigationBarView> createState() => _NavigationBarViewState();
}

class _NavigationBarViewState extends State<NavigationBarView> {
  final controller = Get.put(NavBarController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.transparent,
        body: IndexedStack(
          index: currentIndex,
          children: children,
        ),
        bottomNavigationBar: BottomNavigationBarWidget(
          currentIndex: currentIndex,
          onTap: controller.changeTabIndex,
        ),
      ),
    );
  }

  int get currentIndex => controller.tabIndex.value;
  final List<Widget> children = [
    const HomeView(),
    const CartView(),
    const FavoriteView(),
    const ProfileNavigatorWidget(),
  ];
}
