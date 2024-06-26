import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // this basically makes it so you can instantiate this class

  static Color lightPrimary = const Color(0xfffcfcff);
  static Color darkPrimary = Colors.black;
  static Color lightAccent = const Color(0xFF4B82FF);
  static Color darkAccent = const Color(0xFF4B82FF);
  static Color lightBG = const Color(0xfffcfcff);
  static Color darkBG = Colors.black;

  static Color redAccent =  Colors.red;
  static Color yellowAccent =  Colors.yellow;


  static Color fifeStarsColor = const Color(0xff415E24);
  static Color fourStarsColor = const Color(0xff5E842F);

  static Color threeStarsColor = const Color(0xffA5CE42);
  static Color towStarsColor = const Color(0xffF6A35E);
  static Color oneStarsColor = const Color(0xffF04350);

  static Color lightGrey = const Color(0xfff4f4f4);
  static const Color notWhite = Color(0xFFEDF0F2);
  static const Color nearlyWhite = Color(0xFFFEFEFE);
  static const Color white = Color(0xFFFFFFFF);
  static const Color nearlyBlack = Color(0xFF213333);
  static const Color grey = Color(0xFF3A5160);
  static const Color dark_grey = Color(0xFF313A44);

  static const Color darkText = Color(0xFF253840);
  static const Color darkerText = Color(0xFF17262A);
  static const Color lightText = Color(0xFF4A6572);
  static const Color deactivatedText = Color(0xFF767676);
  static const Color dismissibleBackground = Color(0xFF364A54);
  static const Color chipBackground = Color(0xFFEEF1F3);
  static const Color spacer = Color(0xFFF2F2F2);

  static const Color transparent = Color.fromARGB(0, 0, 0, 0);
  static const Color nearlyBlue = Color(0xFF00B6F0);

  // static const Color lightGray = Color(0xFF8D8D8D);
  static const Color lightGray2 = Colors.black26;

//  static const Map<int, Color> orange = const <int, Color>{
//    50: const Color(0xFFFCF2E7),
//    100: const Color(0xFFF8DEC3),
//    200: const Color(0xFFF3C89C),
//    300: const Color(0xFFEEB274),
//    400: const Color(0xFFEAA256),
//    500: const Color(0xFFE69138),
//    600: const Color(0xFFE38932),
//    700: const Color(0xFFDF7E2B),
//    800: const Color(0xFFDB7424),
//    900: const Color(0xFFDC3852),
//  };

  static const Map<int, Color> orange = <int, Color>{
    50: Color(0xFFFCF2E7),
    100: Color(0xFFF8DEC3),
    200: Color(0xFFF3C89C),
    300: Color(0xFFEEB274),
    400: Color(0xFFEAA256),
    500: Color(0xFFE69138),
    600: Color(0xFFE38932),
    700: Color(0xFFDF7E2B),
    800: Color(0xFFDB7424),
    900: Color(0xFFD56217),
  };

  static getRateColor(int stars) {
    switch (stars) {
      case 1:
        return oneStarsColor;
      case 2:
        return towStarsColor;
      case 3:
        return threeStarsColor;
      case 4:
        return fourStarsColor;
      case 5:
        return fifeStarsColor;
    }
  }
}
