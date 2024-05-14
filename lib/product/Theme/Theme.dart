import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:turkiye_yazilim_staj/product/util/const/colors.dart';

mixin AppTheme {
  static ThemeData productTheme(BuildContext context) {
    //Todo: şunu da bir dene return ThemeData.light().copyWith
    return ThemeData(
      appBarTheme: AppBarTheme(
        titleTextStyle: Theme.of(context).textTheme.displayMedium!.copyWith(
              color: ColorsProject.apricotSorbet,
            ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: ColorsProject.apricotSorbet,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
          backgroundColor: ColorsProject.apricotSorbet,
          elevation: 10,
        ),
      ),
      textTheme: _appTextTheme(context),
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    );
  }

  static TextTheme _appTextTheme(BuildContext context) {
    return TextTheme(
      bodyLarge: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
      bodyMedium: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
      bodySmall: Theme.of(context).textTheme.bodySmall!.copyWith(
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
      displayLarge: Theme.of(context).textTheme.displayLarge!.copyWith(
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
      displayMedium: Theme.of(context).textTheme.displayMedium!.copyWith(
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
      displaySmall: Theme.of(context).textTheme.displaySmall!.copyWith(
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
      labelLarge: Theme.of(context).textTheme.labelLarge!.copyWith(
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
      labelMedium: Theme.of(context).textTheme.labelMedium!.copyWith(
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
      labelSmall: Theme.of(context).textTheme.labelSmall!.copyWith(
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
      titleLarge: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
      titleMedium: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
      titleSmall: Theme.of(context).textTheme.titleSmall!.copyWith(
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
      headlineLarge: Theme.of(context).textTheme.headlineLarge!.copyWith(
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
      headlineMedium: Theme.of(context).textTheme.headlineMedium!.copyWith(
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
      headlineSmall: Theme.of(context).textTheme.headlineSmall!.copyWith(
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
    );
  }
}
