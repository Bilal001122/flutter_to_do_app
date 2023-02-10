import 'package:flutter/material.dart';
import 'package:flutter_to_do_app/const/colors.dart';

class Themes {

  static final ThemeData kLightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: kPrimaryColor,
    ),
    colorScheme: ColorScheme.fromSwatch(
      backgroundColor: kWhiteColor,
      brightness: Brightness.light, // tells that the background color must be white
    ),
    scaffoldBackgroundColor: kWhiteColor,
    primaryColor:
        kPrimaryColor, // for changing the color of the Buttons
  );

  static final ThemeData kDarkTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: kDarkGreyColor,
    ),
    colorScheme: ColorScheme.fromSwatch(
      backgroundColor: kDarkGreyColor,
      brightness: Brightness.dark, // tells that the background color must be dark
    ),
    primaryColor:
        kDarkGreyColor, // for changing the color of the Buttons
  );
}
