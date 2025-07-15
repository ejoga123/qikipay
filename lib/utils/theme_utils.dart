import 'package:flutter/material.dart';

class ThemeUtils {
  static bool isDarkMode(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;

  static Color dynamicTextColor(BuildContext context) =>
      isDarkMode(context) ? Colors.white : Colors.black;

  static ThemeData getTheme(bool isDark) =>
      isDark ? ThemeData.dark() : ThemeData.light();
}
