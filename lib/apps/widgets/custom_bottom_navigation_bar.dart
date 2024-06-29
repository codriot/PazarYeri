import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:turkiye_yazilim_staj/apps/utility/project_util/mixin/custom_gradient.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({
    required this.currentIndex,
    required this.onTap,
    super.key,
  });
  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: CustomGradient.bottomNavBarGradient(),
      ),
      child: CustomNavigationBar(
        iconSize: 30,
        currentIndex: currentIndex,
        onTap: onTap,
        selectedColor: Colors.white,
        strokeColor: Colors.white12,
        unSelectedColor: Colors.white,
        backgroundColor: const Color.fromARGB(0, 212, 177, 177),
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
