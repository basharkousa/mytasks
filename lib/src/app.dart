import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../generated/locales.g.dart';
import 'configs/app_theme.dart';
import 'configs/navigation/routes.dart';
import 'data/local/datasources/sharedpref/shared_preference_helper.dart';
import 'di/bindings/app_binding.dart';
import 'ui/screens/getStartedScreens/splashScreen/splash_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      // statusBarBrightness:
      //     Platform.isAndroid ? Brightness.light : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.grey,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(375, 812),
      builder: (context, child) {
        return GetMaterialApp(
          initialBinding: AppBindings(),
          fallbackLocale: const Locale('en', 'US'),
          // locale: Locale('en'),
          locale: Locale(
              Get.find<SharedPreferenceHelper>().currentLanguage ?? 'en'),
          translationsKeys: AppTranslation.translations,
          debugShowMaterialGrid: false,
          title: "My Tasks App",
          // theme: AppTheme.darkTheme(Get.find<SharedPreferenceHelper>().currentLanguage??'ar'),
          theme: Get.find<SharedPreferenceHelper>().isDarkMode
              ? AppTheme.darkTheme(
              Get.find<SharedPreferenceHelper>().currentLanguage ?? 'en')
              : AppTheme.lightTheme(
              Get.find<SharedPreferenceHelper>().currentLanguage ?? 'en'),
          initialRoute: SplashScreenPage.route,
          // home:const SplashScreenPage(),
          getPages: Routes.getPages,
          onGenerateRoute: Routes.generateRoute,
        );
      },
    );
  }
}
