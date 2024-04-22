import 'package:flutter/material.dart';
import 'package:kanban_application/board/models/kanban_card_model.dart';
import 'package:kanban_application/board/models/kanban_column_model.dart';
import 'package:kanban_application/board/services/kanban_service.dart';
import 'package:kanban_application/board/widget/card_search_bar.dart';
import 'package:kanban_application/board/widget/kanban_button.dart';
import 'package:kanban_application/board/widget/remove_all_cards_button.dart';

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

  bool _capitalText = false;

  @override
  void initState() {
    super.initState();
    initialize();
  }

  Future initialize() async {
    originalCards = _kanban.getAllCards();
    var cards = await _kanban.loadKanbanData();

    for (var card in cards) {
      kanbanColumns.where((column) => column.title == card.column)
        .forEach((column) {
          column.cards.add(card);
          column.itemCount++;
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
        Row(
          children: [
            CardSearchBar(
              onSearch: (query) {
                updateCardVisibility(query);
              },
            ),
            KanbanButton(
              icon: Icons.delete_forever, 
              onPressed: () {
                _kanban.removeAllCards();
                updateColumnItemCount();
              }, 
              message: "remove all"
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: primaryPaddingValue*4),
              child: KanbanButton(
                icon: Icons.text_format, 
                onPressed: () {
                  setState(() {
                    _capitalText = !_capitalText;
                  });
                }, 
                message: "capital text"
              ),
            )
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height - actionBarHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: kanbanColumns.map((column) => KanbanColumn(
              capitalText: _capitalText,
              column: column,
              onCardMoved: (card, column) {
                updateKanban(card, column);
              },
            )).toList(),
          ),
        ),
      ],
    ),
  );

  void updateKanban(KanbanCardModel card, KanbanColumnModel column) {
    final previousColumn = kanbanColumns
      .firstWhere((column) => column.title == card.column);

    card.column = column.title;

    previousColumn.cards.remove(card);
    column.cards.add(card);

    column.itemCount = column.cards.length;
    previousColumn.itemCount = previousColumn.cards.length;

    _kanban.storeKanbanCard(card);

    setState(() {});
  }

  void updateCardVisibility(String query) {
    originalCards = _kanban.getAllCards();

    for (var column in kanbanColumns) {
      for (var card in column.cards) {
        card.isVisible = false;
      }
    }

    for (var card in originalCards) {
      card.isVisible = card.title.toLowerCase().contains(query.toLowerCase()) ? true : false;
    }

    setState(() {});
  }

  void updateColumnItemCount() {
    setState(() {
      for (var column in kanbanColumns) {
        column.itemCount = column.cards.length;
      }
    });
  }
}
