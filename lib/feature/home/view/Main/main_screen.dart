import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/feature/cart/view/cart_view.dart';
import 'package:turkiye_yazilim_staj/feature/home/view/favourite_view.dart';
import 'package:turkiye_yazilim_staj/feature/home/view/profile/profile_view.dart';
import 'package:turkiye_yazilim_staj/feature/product_detail/view/al_comment.dart';

part 'main_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/images/BackgroundImage.png",
            fit: BoxFit.cover, height: Get.height, width: Get.width),
        Scaffold(
          appBar: const CustomAppBar(),
          body: children[currentIndex],
          bottomNavigationBar: _bottomNavigationBar(),
        ),
      ],
    );
  }

  int currentIndex = 0;
  final List<Widget> children = [
    const AllCommentView(),
    const FavouriteView(),
    const CartView(),
    const ProfileView(),
  ];

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  CustomNavigationBar _bottomNavigationBar() {
    return CustomNavigationBar(
      iconSize: 30.0,
      currentIndex: currentIndex,
      onTap: onTabTapped,
      selectedColor: Colors.white,
      strokeColor: const Color(0x30040307),
      unSelectedColor: Colors.white,
      backgroundColor: const Color(0xffB9987C),
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
    );
  }
}
