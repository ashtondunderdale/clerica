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
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: columnTitles.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    left: index == 0 ? 10 : 0,
                    right: index == columnTitles.length - 1 ? 10 : 0,
                  ),
                  child: KanbanColumn(columnTitle: columnTitles[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
