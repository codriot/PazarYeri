import 'package:flutter/material.dart';
import 'package:turkiye_yazilim_staj/product/const/colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: ColorsProject.grey.withOpacity(0.13),
      thickness: 1,
    );
  }
}

class CustomVerticalDivider extends StatelessWidget {
  const CustomVerticalDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const VerticalDivider(
      color: Colors.black,
      thickness: 0.5,
      endIndent: 3,
      indent: 3,
    );
  }
}
