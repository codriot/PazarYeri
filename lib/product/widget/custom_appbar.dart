// Todo HasNotification getx ile yapılacak
import 'package:flutter/material.dart';
import 'package:turkiye_yazilim_staj/product/util/const/colors.dart';
import 'package:turkiye_yazilim_staj/product/util/mixin/custom_gradient.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key,
      this.hasNotification = false,
      required this.isWhite,
      this.isTransparent = false});
  final bool? hasNotification;
  final bool? isWhite;
  final bool? isTransparent;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      if (!isTransparent!)
        Container(
          decoration: BoxDecoration(
            gradient: isWhite! ? null : CustomGradient.linearGradient(),
            color: isWhite! ? Colors.white : null,
          ),
        ),
      if (isWhite! == true)
        Container(
          color: Colors.white,
        ),
      AppBar(
        title: Text(
          "PAZARYERİ",
          style: TextStyle(
              color: isWhite! || isTransparent!
                  ? ColorsProject.apricotSorbet
                  : Colors.white),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: hasNotification!
                ? Image.asset("assets/images/HasNotification.png", width: 30)
                : Image.asset("assets/images/notification.png", width: 30),
          ),
        ],
      ),
    ]);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
