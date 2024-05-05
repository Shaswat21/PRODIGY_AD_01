import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ThemeClass {
  Color lightBackgroundColor = HexColor('#f5f3f4');
  Color lightPrimaryColor = HexColor('#F49242');
  Color digitColor = HexColor("#000000");
  Color darkDigitColor = HexColor('#FFFFFF');
  Color shortTextColor = HexColor('#FF5500');
  Color darkTextColor = HexColor('#388100');
  Color darkPrimaryColor = HexColor('#2A2A2A');
  Color errorColor = HexColor('#FF333B');
  Color secondaryColor = HexColor('#FF8B6A');
  Color accentColor = HexColor('#FFBF98');
  Color labelSmall = HexColor('#8a8a8a');

  //Light Theme
  static ThemeData lightTheme = ThemeData(
    primaryColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: _themeClass.lightBackgroundColor,
      centerTitle: true,
    ),
    scaffoldBackgroundColor: _themeClass.lightBackgroundColor,
    indicatorColor: Colors.black,
    bottomAppBarTheme: BottomAppBarTheme(color: _themeClass.accentColor),
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: Colors.green),
    splashColor: Colors.transparent,
    shadowColor: Colors.blueGrey.shade200,
    dividerColor: Colors.grey,
    dividerTheme: const DividerThemeData().copyWith(
      color: Colors.grey,
    ),
    textTheme: const TextTheme().copyWith(
      bodyLarge: TextStyle(color: _themeClass.shortTextColor),
      bodyMedium: TextStyle(color: _themeClass.shortTextColor),
      bodySmall: TextStyle(color: _themeClass.shortTextColor),
      titleLarge: TextStyle(color: _themeClass.shortTextColor, fontSize: 40),
      titleMedium: TextStyle(color: _themeClass.shortTextColor, fontSize: 30),
      titleSmall: TextStyle(color: _themeClass.lightPrimaryColor),
      labelLarge: TextStyle(color: _themeClass.shortTextColor, fontSize: 40),
      labelMedium: TextStyle(color: _themeClass.digitColor, fontSize: 30),
      labelSmall: TextStyle(color: _themeClass.labelSmall, fontSize: 25),
    ),
    colorScheme: const ColorScheme.light().copyWith(
      primary: _themeClass.lightPrimaryColor,
      secondary: _themeClass.secondaryColor,
      error: _themeClass.errorColor,
    ),
  );

  //Dark Theme
  static ThemeData darkTheme = ThemeData(
    primaryColor: _themeClass.darkPrimaryColor,
    indicatorColor: Colors.white,
    textTheme: const TextTheme().copyWith(
      titleLarge: TextStyle(color: _themeClass.darkTextColor, fontSize: 40),
      titleMedium: TextStyle(color: _themeClass.darkTextColor, fontSize: 30),
      labelLarge: TextStyle(color: _themeClass.darkDigitColor, fontSize: 40),
      labelMedium: TextStyle(color: _themeClass.darkDigitColor, fontSize: 30),
      labelSmall: TextStyle(color: _themeClass.labelSmall, fontSize: 25),
    ),
    colorScheme: const ColorScheme.dark().copyWith(
      primary: _themeClass.darkPrimaryColor,
    ),
  );
}

ThemeClass _themeClass = ThemeClass();
