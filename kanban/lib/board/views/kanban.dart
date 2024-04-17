import 'package:flutter/material.dart';
import 'package:kanban_application/board/data.dart';
import 'package:kanban_application/board/widget/kanban_colum.dart';
import 'package:kanban_application/constants.dart';

class Kanban extends StatelessWidget {
  const Kanban({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
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
