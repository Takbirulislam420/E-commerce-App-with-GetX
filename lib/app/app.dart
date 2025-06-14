import 'package:flutter/material.dart';
import 'package:mkr_mart/app/app_routes.dart';
import 'package:mkr_mart/app/app_theme.dart';
import 'package:mkr_mart/features/auth/ui/screen/splash_screen.dart';

class MkrMart extends StatefulWidget {
  const MkrMart({super.key});

  @override
  State<MkrMart> createState() => _MkrMartState();
}

class _MkrMartState extends State<MkrMart> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemes.lightThemeData,
      darkTheme: AppThemes.lightThemeData,
      initialRoute: SplashScreen.name,
      onGenerateRoute: AppRoutes.routes,
    );
  }
}
