import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../../../../../generated/locales.g.dart';
import '../splashScreen/splash_screen_controller.dart';
import '../../../widgets/common/getx_state_widget.dart';
import '../../../widgets/sections/app_logo_widget.dart';
import '../../../widgets/sections/background_theme_widget.dart';

// import 'package:onesignal_flutter/onesignal_flutter.dart';

class SplashScreenPage extends StatelessWidget {
  static const String route = "/";

  final SplashScreenController controller = Get.find();

  SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          // backgroundColor: Colors.black,
          body: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              const BackGroundThemeWidget(),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const AppLogoSection(),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 34.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GetXStateWidget(
                        snapshotLiveData: controller.loginResponseLiveData,
                        loadingWidget: SpinKitCircle(
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                          // color: Colors.red,
                          size: 32.h,
                        ),
                      ),
                      SizedBox(
                        height: 21.h,
                      ),
                      Text(
                        LocaleKeys.best_choice_to_organize_your_tasks.tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.sp,
                          // fontFamily: FontFamily.montserrat,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

// Future<void> showLoginPage(BuildContext context) async{
//   scheduleMicrotask((){
//     Navigator.pushReplacementNamed(context, SelectLanguagesPage.selectLanguagesRoute);
//   });
// }
}