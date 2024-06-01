import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../ui/screens/getStartedScreens/splashScreen/splash_screen.dart';

class Routes {
  Routes._();

  static final List<GetPage> getPages = [
    GetPage(
      name: SplashScreenPage.route,
      page: () =>  SplashScreenPage(),
    ),
    // GetPage(
    //   name: HomePage.homePageRoute,
    //   page: () => HomePage(),
    // ),
  ];

  static Route<dynamic> generateRoute(RouteSettings settings,)  {
    switch (settings.name) {
      case SplashScreenPage.route:
        return MaterialPageRoute(builder: (_) {
          return SplashScreenPage(
          );
        });
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
