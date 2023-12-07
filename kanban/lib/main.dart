import 'package:flutter/material.dart';
import 'package:kanban_application/views/login_view.dart';
import 'views/home_view.dart';
import 'views/welcome_view.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "kanban",
      home: LoginView(),
      debugShowCheckedModeBanner: false,
    );
  }
}