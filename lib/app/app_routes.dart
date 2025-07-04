import 'package:flutter/material.dart';
import 'package:mkr_mart/features/auth/ui/screen/login_screen.dart';
import 'package:mkr_mart/features/auth/ui/screen/sign_up_screen.dart';
import 'package:mkr_mart/features/auth/ui/screen/splash_screen.dart';
import 'package:mkr_mart/features/common/ui/screen/main_bottom_nav_screen.dart';
import 'package:mkr_mart/features/home/ui/screen/home_screen.dart';
import 'package:mkr_mart/features/products/ui/screen/product_category_screen.dart';

class AppRoutes {
  static Route<dynamic> routes(RouteSettings settings) {
    late final Widget screenWidget;
    if (settings.name == SplashScreen.name) {
      screenWidget = SplashScreen();
    } else if (settings.name == LoginScreen.name) {
      screenWidget = LoginScreen();
    } else if (settings.name == SignUpScreen.name) {
      screenWidget = SignUpScreen();
    } else if (settings.name == HomeScreen.name) {
      screenWidget = HomeScreen();
    } else if (settings.name == ProductCategoryScreen.name) {
      screenWidget = ProductCategoryScreen();
    } else if (settings.name == MainBottomNavScreen.name) {
      screenWidget = MainBottomNavScreen();
    }
    return MaterialPageRoute(builder: (context) => screenWidget);
  }
}
