import 'package:flutter/material.dart';
import 'package:kanban_application/utils/light_theme.dart';
import 'utils/dark_theme.dart';
import 'views/kanban_view.dart';
import 'views/home_view.dart';
import 'views/task_view.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "kanban",
      home: KanbanView(),
      theme: darkTheme,
      darkTheme: darkTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}