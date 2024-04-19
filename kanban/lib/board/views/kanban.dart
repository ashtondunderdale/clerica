import 'package:flutter/material.dart';
import 'package:kanban_application/board/models/kanban_card_model.dart';
import 'package:kanban_application/board/models/kanban_column_model.dart';
import 'package:kanban_application/board/services/kanban_service.dart';

import '../../constants.dart';
import '../data.dart';
import '../widget/kanban_colum.dart';


class Kanban extends StatefulWidget {
  const Kanban({super.key});

  @override
  State<Kanban> createState() => _KanbanState();
}

class _KanbanState extends State<Kanban> {
  KanbanService _kanban = KanbanService();

  @override
  void initState() {
    super.initState();
    initialize();
  }

  Future initialize() async {
    for (var card in await _kanban.loadKanbanData()) {
      kanbanColumns.where((column) => column.title == card.column).forEach((column) {
        column.cards.add(card);
      });
    }

    setState(() {}); 
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: white,
    body: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: kanbanColumns.map((column) => KanbanColumn(
          column: column, 
          onCardMoved: (card, column){
            updateKanban(card, column);
          },
        )).toList(),
      ),
    ),
  );

  void updateKanban(KanbanCardModel card, KanbanColumnModel column) {
    final previousColumn = kanbanColumns.firstWhere((column) => column.title == card.column);
    card.column = column.title;

    previousColumn.cards.remove(card);
    column.cards.add(card);

    column.itemCount = column.cards.length;
    previousColumn.itemCount = previousColumn.cards.length;

    _kanban.saveKanbanData(card);
    
    setState(() {});
  }
}

