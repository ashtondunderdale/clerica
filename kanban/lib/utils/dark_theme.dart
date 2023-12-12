import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Color.fromARGB(255, 61, 61, 61),
    onPrimary: Color.fromARGB(255, 255, 255, 255),
    onSecondary: const Color.fromARGB(255, 83, 83, 83),
    onTertiary: Color.fromARGB(255, 124, 124, 124),
    onTertiaryContainer: Color.fromARGB(255, 101, 101, 101)
  )
);