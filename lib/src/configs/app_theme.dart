import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../generated/fonts.gen.dart';
import '../../src/data/local/datasources/sharedpref/constants/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme(String locale) => ThemeData.light(useMaterial3: false).copyWith(
    colorScheme: ColorScheme.light(
        primary: AppColors.lightPrimary,
        secondary: AppColors.lightAccent,
        onSecondary: AppColors.lightAccent,
        background: AppColors.lightBG
    ).copyWith(background: AppColors.lightBG),
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: AppColors.lightBG,
      titleTextStyle: TextStyle(
        color: AppColors.darkBG,
        fontSize: 18.0.sp,
        fontWeight: FontWeight.w800,
        fontFamily: locale == "ar" ? FontFamily.plexSansArabic:  FontFamily.montserrat,
      ),
    ),
    // scaffoldBackgroundColor: AppColors.lightBG,
    textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColors.lightAccent,
        selectionColor: AppColors.lightAccent,
        selectionHandleColor: AppColors.lightAccent),
    // cursorColor: AppColors.lightAccent,
    brightness: Brightness.light,
    platform: TargetPlatform.iOS,
    textTheme: ThemeData.light().textTheme.apply(
      fontFamily:
      locale == "ar" ? FontFamily.plexSansArabic :  FontFamily.montserrat,
      bodyColor:Color(0xff151515)
    ),
  );

  static ThemeData darkTheme(String locale) => ThemeData.light(useMaterial3: false).copyWith(
    colorScheme: ColorScheme.dark(
      primary:  AppColors.darkPrimary,
      secondary: AppColors.lightAccent,
      onSecondary: AppColors.lightAccent,
      background: AppColors.lightBG,
    ).copyWith(background: AppColors.darkBG),
    scaffoldBackgroundColor: AppColors.darkBG,
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: AppColors.darkBG,
      titleTextStyle: TextStyle(
        color: AppColors.darkBG,
        fontSize: 18.0.sp,
        fontWeight: FontWeight.w700,
        fontFamily:
        locale == "ar" ? FontFamily.plexSansArabic :   FontFamily.montserrat,
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColors.darkAccent,
        selectionColor: AppColors.darkAccent,
        selectionHandleColor: AppColors.darkAccent),
    // cursorColor: AppColors.lightAccent,
    platform: TargetPlatform.iOS,
    textTheme: ThemeData.light().textTheme.apply(
      fontFamily: locale == "ar" ? FontFamily.plexSansArabic : FontFamily.montserrat,
        //
        // displayColor: Colors.white,
        bodyColor: Color(0xffFFFFFF)
    ),
  );

  static void changeAppTheme(bool value) async {
    var prefs = await SharedPreferences.getInstance();
    // if (locale == type) {
    //   return;
    // }
    if (value) {
      await prefs.setBool(Preferences.is_dark_mode, value);
      Get.changeTheme(AppTheme.darkTheme(prefs.getString('language_code')??"en"));
      Get.forceAppUpdate();
    } else {
      await prefs.setBool(Preferences.is_dark_mode, value);
      Get.changeTheme(AppTheme.lightTheme(prefs.getString('language_code')??"en"));
      Get.forceAppUpdate();

    }
  }

  static const List<Shadow> textShadow = <Shadow>[
    Shadow(
      offset: Offset(1.0, 1.0),
      blurRadius: 3.0,
      color: Color.fromARGB(255, 0, 0, 0),
    ),
    Shadow(
      offset: Offset(1.0, 1.0),
      blurRadius: 8.0,
      color: Color.fromARGB(125, 0, 0, 0),
    ),
  ];

}
