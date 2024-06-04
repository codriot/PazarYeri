import 'package:flutter/material.dart';
import 'package:turkiye_yazilim_staj/product/widget/general_app_bar.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: GeneralAppBar(colorsAppBar: Colors.white),
    );
  }
}
