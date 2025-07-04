import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mkr_mart/app/app_routes.dart';
import 'package:mkr_mart/app/app_theme.dart';
import 'package:mkr_mart/app/controller_binder.dart';
import 'package:mkr_mart/features/auth/ui/screen/splash_screen.dart';

class MkrMart extends StatefulWidget {
  const MkrMart({super.key});

  @override
  State<MkrMart> createState() => _MkrMartState();
}

class _MkrMartState extends State<MkrMart> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppThemes.lightThemeData,
      darkTheme: AppThemes.lightThemeData,

      onGenerateRoute: AppRoutes.routes,
      initialBinding: ControllerBinder(),
      initialRoute: SplashScreen.name,
    );
  }
}
