import 'package:flutter/material.dart';
import 'package:kanban_application/utils/light_theme.dart';
import 'package:kanban_application/views/home.dart';
import 'utils/dark_theme.dart';

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

class MyTheme with ChangeNotifier{

  static bool _isDark = false;

  ThemeMode currentTheme(){
    return _isDark ? ThemeMode.dark : ThemeMode.light;
  }

  void switchTheme(){
    _isDark = !_isDark;
    notifyListeners();
  }

  void updateColumns(){ 
    notifyListeners();
  }
}

MyTheme currentTheme = MyTheme();