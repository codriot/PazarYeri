import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/core/gen/assets.gen.dart';
import 'package:turkiye_yazilim_staj/product/navigator/navigator.dart';
import 'package:turkiye_yazilim_staj/product/util/const/colors.dart';
import 'package:turkiye_yazilim_staj/product/util/mixin/custom_gradient.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    required this.colorsAppBar,
    super.key,
    this.hasNotification = false,
    this.isGradient = false,
  });
  final bool hasNotification;
  final Color colorsAppBar;
  final bool? isGradient;

  ///3 ihtimal var gradient white ve transparent
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (isGradient!)
          Container(
            decoration: BoxDecoration(
              gradient: CustomGradient.linearGradient(),
            ),
          ),
        AppBar(
          backgroundColor: colorsAppBar,
          title: Text(
            'PAZARYERİ',
            style: TextStyle(
              color: !isGradient! ? ColorsProject.apricotSorbet : Colors.white,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Get.toNamed(Navigate.notification.route);
              },
              icon: Padding(
                padding: const EdgeInsets.all(10),
                child: hasNotification
                    ? Image.asset(
                        Assets.images.hasNotification.path,
                        width: 30,
                      )
                    : Image.asset(Assets.images.notification.path, width: 27),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
