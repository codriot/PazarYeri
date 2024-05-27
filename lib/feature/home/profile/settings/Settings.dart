import 'package:flutter/material.dart';
import 'package:turkiye_yazilim_staj/product/widget/custom_appbar.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(colorsAppBar: Colors.white),
      body: Center(
        child: Text('Settings'),
      ),
    );
  }
}
