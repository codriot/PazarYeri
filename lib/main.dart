import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/feature/home/view/home.dart';
import 'package:turkiye_yazilim_staj/product/util/const/colors.dart';

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
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          titleTextStyle: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: ColorsProject.apricotSorbet,
              ),
          elevation: 0,
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: ColorsProject.apricotSorbet,
          textTheme: ButtonTextTheme.primary,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13),
            ),
            // ! neden çalışmıyor

            backgroundColor: ColorsProject.apricotSorbet,
            elevation: 10,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
    );
  }
}
