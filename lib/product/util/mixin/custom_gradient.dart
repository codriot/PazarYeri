import 'package:flutter/material.dart';

mixin CustomGradient {
  static LinearGradient linearGradient() {
    return const LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Color(0xFFDAC6B5),
        Color(0xFFb59376),
      ],
    );
  }
}
