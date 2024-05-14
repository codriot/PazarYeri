import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/feature/Main/main_screen.dart';
import 'package:turkiye_yazilim_staj/product/Theme/Theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.productTheme(context),
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
    );
  }
}
