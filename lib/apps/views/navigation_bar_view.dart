import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/apps/controllers/navigation_bar_controller.dart';
import 'package:turkiye_yazilim_staj/apps/routes/profile_navigator.dart';
import 'package:turkiye_yazilim_staj/apps/views/cart/cart_view.dart';
import 'package:turkiye_yazilim_staj/apps/views/favourite_view.dart';
import 'package:turkiye_yazilim_staj/apps/views/home_view.dart';
import 'package:turkiye_yazilim_staj/apps/widgets/custom_bottom_navigation_bar.dart';

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
    const ProfileNavigator(),
  ];
}
