import 'package:flutter/material.dart';

import '../../constants.dart';
import '../data.dart';
import '../widget/kanban_colum.dart';


class Kanban extends StatelessWidget {
  const Kanban({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: white,
    body: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: kanbanColumns.map((column) => KanbanColumn(column: column)).toList(),
      ),
    ),
  );
}

