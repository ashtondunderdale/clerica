import 'package:flutter/material.dart';
import 'package:kanban_application/views/kanbanView.dart';

import 'views/loginView.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: KanbanView(),
    );
  }
}