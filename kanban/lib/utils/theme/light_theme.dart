import 'package:flutter/material.dart';


ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
    colorScheme: ColorScheme.light(
    background: Color.fromARGB(255, 255, 255, 255), // main background
    onPrimary: Color.fromARGB(255, 151, 151, 151), // all text
    onSurfaceVariant: Color.fromARGB(255, 53, 53, 53), // card text
    onSecondary: Color.fromARGB(255, 255, 255, 255), // lighter widgets
    onTertiary: Color.fromARGB(255, 236, 236, 236), // lighter widgets
    onTertiaryContainer: Color.fromARGB(255, 255, 255, 255), // card colours
    onPrimaryContainer: Color.fromARGB(255, 255, 255, 255), // app bar background

    onSurface: Color.fromARGB(255, 0, 0, 0), // box shadow
  )
);