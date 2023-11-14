import 'package:flutter/material.dart';

void main() => runApp(KanbanApp());

class KanbanApp extends StatelessWidget {
  const KanbanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kanban Application',
      home: KanbanHome(title: 'Flutter Kanban'),
    );
  }
}

class KanbanHome extends StatefulWidget {
  const KanbanHome({super.key, required this.title});

  final String title;

  @override
  State<KanbanHome> createState() => _KanbanHomeState();
}

class _KanbanHomeState extends State<KanbanHome> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}