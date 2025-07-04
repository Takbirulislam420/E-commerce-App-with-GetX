import 'package:flutter/material.dart';
import 'package:mkr_mart/app/app_colors.dart';

class AppThemes {
  static ThemeData get lightThemeData {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.amber),
      textTheme: _textTheme,
      inputDecorationTheme: _inputDecoration,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          fixedSize: Size.fromWidth(double.maxFinite),
          backgroundColor: AppColors.themeColors,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: EdgeInsets.symmetric(vertical: 12),
          textStyle: TextStyle(
            fontSize: 16,
            letterSpacing: 0.4,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(fontSize: 18, color: Colors.black87),
      ),
    );
  }

  static TextTheme get _textTheme {
    return TextTheme(
      titleLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        letterSpacing: .4,
      ),
      titleMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        letterSpacing: .4,
      ),
      titleSmall: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        letterSpacing: .4,
      ),
      headlineMedium: TextStyle(color: Colors.grey, fontSize: 16),
    );
  }

  static InputDecorationTheme get _inputDecoration {
    return InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      border: _getInputBorder(AppColors.themeColors),
      enabledBorder: _getInputBorder(AppColors.themeColors),
      focusedBorder: _getInputBorder(AppColors.themeColors),
      errorBorder: _getInputBorder(Colors.red),
      hintStyle: TextStyle(fontWeight: FontWeight.w400, color: Colors.grey),
    );
  }

  static OutlineInputBorder _getInputBorder(Color color) {
    return OutlineInputBorder(borderSide: BorderSide(color: color, width: 1.2));
  }
}
