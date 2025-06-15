import 'package:flutter/material.dart';
import 'package:mkr_mart/features/auth/ui/widgets/app_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static final String name = "/";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
