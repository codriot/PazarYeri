import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/product/Theme/Theme.dart';
import 'package:turkiye_yazilim_staj/product/init/init_project.dart';
import 'package:turkiye_yazilim_staj/product/navigator/navigator.dart';

Future<void> main() async {
  await InitProject().initProject();
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
      initialRoute: NavigateMixin.init,
      getPages: NavigateMixin.routes,
    );
  }
}
