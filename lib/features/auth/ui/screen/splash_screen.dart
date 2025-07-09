import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mkr_mart/features/auth/ui/screen/login_screen.dart';
import 'package:mkr_mart/features/auth/ui/widgets/app_logo.dart';
import 'package:mkr_mart/features/common/controller/auth_controller.dart';
import 'package:mkr_mart/features/common/ui/screen/main_bottom_nav_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static final String name = "/";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthController _authController = Get.find<AuthController>();

  @override
  void initState() {
    super.initState();
    _moveToHomeScreen();
  }

  Future<void> _moveToHomeScreen() async {
    await Future.delayed(Duration(seconds: 5));
    // ignore: use_build_context_synchronously
    _authController.getUserData();

    if (_authController.accessToken != null) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, MainBottomNavScreen.name);
    } else {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, LoginScreen.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Spacer(),
              AppLogo(width: 150),
              Spacer(),
              CircularProgressIndicator(),
              SizedBox(height: 15),
              Text("version: 1.0.0", style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }
}
