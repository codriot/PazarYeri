import 'package:flutter/material.dart';
import 'package:turkiye_yazilim_staj/apps/widgets/general_app_bar.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: GeneralAppBar(colorsAppBar: Colors.white),
      body: Center(
        child: Text('Settings'),
      ),
    );
  }
}
