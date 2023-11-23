import 'package:flutter/material.dart';

import 'kanban_column_top.dart';

class KanbanColumn extends StatelessWidget {
  const KanbanColumn({Key? key, required this.columnTitle}) : super(key: key);

  final String columnTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        KanbanColumnTop(title: columnTitle),

        Padding(
          padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
          child: Container(
            height: 650,
            width: 240,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
