import 'package:flutter/material.dart';
import 'package:kanban_application/views/kanban_view.dart';

import 'views/login_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kanban Application',
      home: LoginView(),
    );
  }
}