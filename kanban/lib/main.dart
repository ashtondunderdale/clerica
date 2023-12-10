import 'package:flutter/material.dart';
import 'views/home_view.dart';
import 'views/test_view.dart';
import 'views/welcome_view.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "kanban",
      home:  HomeView(),
      debugShowCheckedModeBanner: false,
    );
  }
}