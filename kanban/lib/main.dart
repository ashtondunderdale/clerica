import 'package:flutter/material.dart';
import 'board/views/kanban.dart';


void main() => runApp(const App()); // flutter run -d chrome --web-port=8989

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Kanban(),
    );
  }
}
