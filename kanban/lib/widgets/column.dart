import 'package:flutter/material.dart';

class KanbanColumn extends StatelessWidget {
  const KanbanColumn({super.key, required this.columnTitle});

  final String columnTitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 200,
      child: Card(
        child: ListTile(
          title: Text(columnTitle),
        ),
      ),
    );
  }
}