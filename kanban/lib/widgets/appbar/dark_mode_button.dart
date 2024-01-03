import 'package:flutter/material.dart';

import '../../main.dart';

class DarkModeButton extends StatelessWidget {
  const DarkModeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: "Change Theme",
      child: FloatingActionButton(
        onPressed: () {
          currentTheme.switchTheme();
        },
        mini: true,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        backgroundColor: Theme.of(context).colorScheme.onSecondary,
        child: currentTheme == ThemeMode.light ? Icon(Icons.light_mode) : Icon(Icons.dark_mode),
      ),
    );
  }
}