import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/product/navigator/navigator.dart';
import 'package:turkiye_yazilim_staj/product/utility/project_util/const/colors.dart';
import 'package:turkiye_yazilim_staj/product/utility/project_util/image/assets.gen.dart';

class CustomAppBarBuilder extends StatelessWidget {
  const CustomAppBarBuilder({
    super.key,
    this.hasNotificationButton = true,
  });
  final bool hasNotificationButton;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.1,
      child: Row(
        children: [
          const Spacer(),
          Expanded(
            flex: 3,
            child: Text(
              'PAZARYERİ',
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: ColorsProject.apricotSorbet,
                    fontSize: 40,
                  ),
            ),
          ),
          if (hasNotificationButton)
            IconButton(
              onPressed: () {
                Get.toNamed(Navigate.notification.route);
              },
              icon: Image.asset(
                Assets.images.notification.path,
                width: 27,
              ),
            )
          else
            const SizedBox(),
        ],
      ),
    );
  }
}
