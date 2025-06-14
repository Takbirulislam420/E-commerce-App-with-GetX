import 'package:flutter/material.dart';
import 'package:mkr_mart/features/auth/ui/screen/splash_screen.dart';

class AppRoutes {
  static Route<dynamic> routes(RouteSettings settings) {
    late final Widget screenWidget;
    if (settings.name == SplashScreen.name) {
      screenWidget = SplashScreen();
    }
    return MaterialPageRoute(builder: (context) => screenWidget);
  }
}
