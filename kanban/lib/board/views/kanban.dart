import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';
import '../bloc/board_bloc.dart';
import '../bloc/board_event.dart';
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
            
            BlocProvider.of<BoardBloc>(context).add(
              BoardCardMovedEvent(card, column, previousColumn),
            );

            setState(() {
              
            });
          }
        )).toList(),
      ),
    ),
  );
}

