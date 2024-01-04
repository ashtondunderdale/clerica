import 'package:flutter/material.dart';

import 'package:kanban_application/utils/theme/dark_theme.dart';
import 'package:kanban_application/utils/theme/light_theme.dart';
import 'package:kanban_application/utils/theme/theme.dart';
import 'package:kanban_application/views/home.dart';


void main() => runApp(const App());

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "kanban",
      home: HomeView(),
      theme: lightTheme,
      darkTheme: darkTheme.copyWith(
        scrollbarTheme: ScrollbarThemeData(thumbColor: MaterialStatePropertyAll(Colors.white)),
      ),
      themeMode: currentTheme.currentTheme(),
      debugShowCheckedModeBanner: false,
    );
  }
}
