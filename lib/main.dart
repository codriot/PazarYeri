import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/feature/mainscreen/main_screen.dart';
import 'package:turkiye_yazilim_staj/product/const/colors.dart';

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
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          titleTextStyle: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: ColorsProject.apricot_sorbet,
              ),
          elevation: 0,
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: ColorsProject.apricot_sorbet,
          textTheme: ButtonTextTheme.primary,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13),
            ),
            // ! neden çalışmıyor
            // textStyle: const TextStyle(
            //   color: ColorsProject.coffeClay,
            //   fontSize: 20,
            // ),
            backgroundColor: ColorsProject.apricot_sorbet,
            elevation: 10,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
    );
  }
}
