import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData get lightThemeData {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.amber),
    );
  }
}
