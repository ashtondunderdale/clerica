import 'package:flutter/material.dart';

import '../../constants.dart';
import '../data.dart';
import '../widget/kanban_colum.dart';


class Kanban extends StatefulWidget {
  const Kanban({super.key});

  @override
  State<Kanban> createState() => _KanbanState();
}

class _KanbanState extends State<Kanban> {
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: white,
    body: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: kanbanColumns.map((column) => KanbanColumn(
          column: column, 
          onCardMoved: (card, column){
            final previousColumn = kanbanColumns.firstWhere((column) => column.title == card.column);
            card.column = column.title;

            previousColumn.cards.remove(card);
            column.cards.add(card);

            column.itemCount = column.cards.length;
            previousColumn.itemCount = previousColumn.cards.length;
            
            setState(() {});
          }
        )).toList(),
      ),
    ),
  );
}

