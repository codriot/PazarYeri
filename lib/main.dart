import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/apps/Theme/Theme.dart';
import 'package:turkiye_yazilim_staj/apps/init/application_initialize.dart';
import 'package:turkiye_yazilim_staj/apps/routes/project_navigator.dart';

Future<void> main() async {
  await InitProject().initProject();
  runApp(const MyApp());
}

/// This widget is the root of your application.
class MyApp extends StatelessWidget {
  /// This method is used to initialize the project
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
