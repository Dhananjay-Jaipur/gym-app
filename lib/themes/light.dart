import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: const ColorScheme(
    surface: Colors.white, 
    onSurface: Colors.black12,
    brightness: Brightness.light,

    error: Colors.white, onError: Colors.black,
    primary: Colors.white, onPrimary: Colors.black,
    
    secondary: Colors.white70, onSecondary: Color(0xA6000000),
    secondaryContainer: Colors.black38,
    shadow: Colors.black12,
    scrim: Colors.black,
    surfaceContainer: Colors.black12,
    surfaceBright: Colors.brown,
  ),

);