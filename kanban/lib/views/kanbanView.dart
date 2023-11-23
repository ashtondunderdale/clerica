import 'package:flutter/material.dart';

import '../widgets/appbar.dart';
import '../widgets/kanban_column.dart';
import '../widgets/kanban_column_top.dart';
import '../widgets/logout_button.dart';
import '../widgets/side_bar.dart';
import '../widgets/side_box.dart';

class KanbanView extends StatelessWidget {
  KanbanView({super.key});

  final List<String> columnTitles = [
    'BACKLOG',
    'DEVELOPING',
    'DEVELOPED',
    'TESTING',
    'TESTED',
    'DONE',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: KanbanAppbar(),
      body: Row(
        children: [
          SideBar(),
          SideBox(),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  6,
                  (index) => Column(
                    children: [
                      if (index == 0)
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: KanbanColumn(columnTitle: columnTitles[index]),
                        )
                      else
                        Padding(
                          padding: const EdgeInsets.only(),
                          child: KanbanColumn(columnTitle: columnTitles[index]),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
