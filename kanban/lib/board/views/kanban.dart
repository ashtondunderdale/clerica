import 'package:flutter/material.dart';
import 'package:kanban_application/board/models/kanban_card_model.dart';
import 'package:kanban_application/board/models/kanban_column_model.dart';
import 'package:kanban_application/board/services/kanban_service.dart';
import 'package:kanban_application/board/widget/card_search_bar.dart';

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
  List<KanbanCardModel> originalCards = [];

  @override
  void initState() {
    super.initState();
    initialize();
  }

  Future initialize() async {
    var cards = await _kanban.loadKanbanData();

    originalCards = _kanban.getAllCards();

    for (var card in cards) {
      kanbanColumns
          .where((column) => column.title == card.column)
          .forEach((column) {
        column.cards.add(card);
      });
    }

    totalCardCount = cards.length;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardSearchBar(
              onSearch: (query) {
                setState(() {

                  for (var column in kanbanColumns) {
                    column.cards.clear();
                  }

                  originalCards = _kanban.getAllCards();

                  for (var card in originalCards) {
                    if (card.title.contains(query)) {
                      kanbanColumns.where((column) => column.title == card.column).forEach((column) {
                        column.cards.add(card);
                      });
                    }
                  }

                  setState(() {});
                });
              },
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                height: MediaQuery.of(context).size.height - actionBarHeight,
                child: Row(
                  children: kanbanColumns
                      .map((column) => KanbanColumn(
                            column: column,
                            onCardMoved: (card, column) {
                              updateKanban(card, column);
                            },
                          ))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      );

  void updateKanban(KanbanCardModel card, KanbanColumnModel column) {
    final previousColumn =
        kanbanColumns.firstWhere((column) => column.title == card.column);
    card.column = column.title;

    previousColumn.cards.remove(card);
    column.cards.add(card);

    column.itemCount = column.cards.length;
    previousColumn.itemCount = previousColumn.cards.length;

    _kanban.saveKanbanData(card);

    setState(() {});
  }
}
