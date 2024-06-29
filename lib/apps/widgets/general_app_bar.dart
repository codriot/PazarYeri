import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/apps/routes/project_navigator.dart';
import 'package:turkiye_yazilim_staj/apps/utility/project_util/const/colors.dart';
import 'package:turkiye_yazilim_staj/apps/utility/project_util/image/assets.gen.dart';

class GeneralAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GeneralAppBar({
    required this.colorsAppBar,
    super.key,
    this.hasNotification = false,
  });
  final bool hasNotification;
  final Color colorsAppBar;

  ///3 ihtimal var gradient white ve transparent
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AppBar(
          backgroundColor: colorsAppBar,
          title: const Text(
            'PAZARYERİ',
            style: TextStyle(
              color: ColorsProject.apricotSorbet,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Get.toNamed(Navigate.notification.route);
              },
              icon: hasNotification
                  ? Image.asset(
                      Assets.images.hasNotification.path,
                      width: 40,
                    )
                  : Image.asset(
                      Assets.images.notification.path,
                      width: 27,
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
