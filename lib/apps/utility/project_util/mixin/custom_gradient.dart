import 'package:flutter/material.dart';
import 'package:turkiye_yazilim_staj/apps/utility/project_util/const/colors.dart';

/// CustomGradient mixin for custom gradient
mixin CustomGradient {
  static LinearGradient linearGradient() {
    return const LinearGradient(
      colors: [
        Color(0xFFDAC6B5),
        Color(0xFFb59376),
      ],
    );
  }

  static LinearGradient detailButtonGradient() {
    return const LinearGradient(
      colors: [
        Color(0xffF9C5B7),
        ColorsProject.apricotSorbet,
      ],
    );
  }

  static LinearGradient walletRecentGradient() {
    return const LinearGradient(
      begin: Alignment.topLeft,
      transform: GradientRotation(3.14 / 4),
      end: Alignment.bottomRight,
      colors: [
        ColorsProject.apricotSorbet,
        Color(0xffF9C5B7),
        Color(0xffF8F8F8),
        Color(0xffF8F8F8),
        Color(0xffF8F8F8),
        Color(0xffF9C5B7),
        ColorsProject.apricotSorbet,
      ],
    );
  }

  static LinearGradient bottomNavBarGradient() {
    return const LinearGradient(
      colors: [
        Color(0xFFDAC6B5),
        Color(0xFFb59376),
      ],
    );
  }
}
