import 'package:flutter/material.dart';

const brightness = Brightness.dark;
const primaryColor = const Color(0xFF00C569);
const lightColor = const Color(0xFFFFFFFF);
const backgroundColor = const Color(0xFFF5F5F5);

ThemeData darkTheme() {
  return ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: brightness,
    primaryColor: primaryColor,
    accentColor: Colors.black26,
    textTheme: TextTheme(
      headline1: TextStyle(
          fontSize: 30, fontWeight: FontWeight.w300, color: primaryColor),
    ),
  );
}
