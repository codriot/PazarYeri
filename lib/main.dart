import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/feature/login/view/login_first.dart';
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
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              ColorsProject.apricot_sorbet,
            ),
          ),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      builder: (context, child) {
        return Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/BackgroundImage.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: child!,
        );
      },
      home: const FirstLoginView(),
    );
  }
}
