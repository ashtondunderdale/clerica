import 'package:flutter/material.dart';
import 'package:kanban_application/board/data.dart';
import 'package:kanban_application/board/models/kanban_column_model.dart';
import 'package:kanban_application/board/widget/kanban_colum.dart';

class Kanban extends StatelessWidget {
  const Kanban({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: kanbanColumns.map((column) {
            return KanbanColumn(
              title: column.title,
              itemCount: column.itemCount,
            );
          }).toList(),
        ),
      ),
    );
  }
}
