import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    surface: Color(0xFF6E7868), // baground color - Color(0xff555D50),
    onSurface: Colors.black,

    primary: Colors.black,
    onPrimary: Colors.white,

    error: Colors.white,
    onError: Colors.black,

    secondary: Color(0xFF802A8F),
    onSecondary: Color(0xFF946D9B),

    secondaryContainer: Colors.black45, //Color(0xff93998f),

    shadow: Colors.white10,
    scrim: Colors.white,
    surfaceContainer: Colors.black45,
    surfaceBright: Colors.white24,
  ),
);
