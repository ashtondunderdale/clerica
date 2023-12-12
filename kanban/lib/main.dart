import 'package:flutter/material.dart';
import 'package:kanban_application/utils/data.dart';
import 'package:kanban_application/utils/light_theme.dart';
import 'utils/dark_theme.dart';
import 'views/kanban_view.dart';
import 'views/home_view.dart';
import 'views/task_view.dart';

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
      darkTheme: darkTheme,
      themeMode: currentTheme.currentTheme(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyTheme with ChangeNotifier{

  static bool _isDark = false;

  ThemeMode currentTheme(){
    return _isDark ? ThemeMode.dark : ThemeMode.light;
  }

  void switchTheme(){
    _isDark = !_isDark;
    notifyListeners();
  }
}

MyTheme currentTheme = MyTheme();