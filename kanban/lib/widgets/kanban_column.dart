import 'package:flutter/material.dart';

import '../globals.dart';
import 'kanban_column_top.dart';

class KanbanColumn extends StatelessWidget {
  const KanbanColumn({Key? key, required this.columnTitle}) : super(key: key);

  final String columnTitle;

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double columnWidth = screenWidth / 8;

    double screenHeight = MediaQuery.of(context).size.height;
    double columnHeight = screenHeight / 1.25;

    return Column(
      children: [
        KanbanColumnTop(title: columnTitle),

        Padding(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Container(
            height: columnHeight,
            width: columnWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: Color.fromARGB(255, 245, 245, 245),
              ),
          ),
        ),
      ],
    );
  }
}
