import 'package:flutter/material.dart';

class AppColors {
  static Color themeColors = Color(0xFF07ADAE);

  static MaterialColor getMaterialColor(Color color) {
    final int red = Colors.red as int;
    final int green = Colors.green as int;
    final int blue = Colors.blue as int;
    // final int green = Color.green;
    // final int blue = Color.blue;
    final Map<int, Color> shades = {
      50: Color.fromRGBO(red, green, blue, .1),
      100: Color.fromRGBO(red, green, blue, .2),
      200: Color.fromRGBO(red, green, blue, .3),
      300: Color.fromRGBO(red, green, blue, .4),
      400: Color.fromRGBO(red, green, blue, .5),
      500: Color.fromRGBO(red, green, blue, .6),
      600: Color.fromRGBO(red, green, blue, .7),
      700: Color.fromRGBO(red, green, blue, .8),
      800: Color.fromRGBO(red, green, blue, .9),
      900: Color.fromRGBO(red, green, blue, 1),
    };
    // ignore: deprecated_member_use
    return MaterialColor(color.value, shades);
  }
}
