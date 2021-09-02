import 'package:flutter/material.dart';
import 'package:gs_two/app/core/const.dart';

abstract class CustomTheme{
  static ThemeData get theme => ThemeData(
    primarySwatch: kPrimaryColor,
    accentColor: kAccentColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.light,
    textTheme: TextTheme(
      button: TextStyle(color: Colors.white),
    ),
    buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
  );
}