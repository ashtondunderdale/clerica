import 'package:flutter/material.dart';


ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Color.fromARGB(255, 41, 41, 41),
    onPrimary: Color.fromARGB(255, 255, 255, 255),
    onSurfaceVariant: Color.fromARGB(255, 255, 255, 255),
    onSecondary: const Color.fromARGB(255, 83, 83, 83),
    onTertiary: Color.fromARGB(255, 103, 103, 103),
    onTertiaryContainer: Color.fromARGB(255, 65, 65, 65),
    onPrimaryContainer: Color.fromARGB(255, 48, 48, 48),

    onSurface: Color.fromARGB(255, 43, 43, 43), // box shadow
  )
);