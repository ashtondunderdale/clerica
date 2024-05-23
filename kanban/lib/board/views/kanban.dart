import 'package:flutter/material.dart';
import 'package:kanban_application/board/models/kanban_card_model.dart';
import 'package:kanban_application/board/models/kanban_column_model.dart';
import 'package:kanban_application/board/services/kanban_service.dart';
import 'package:kanban_application/board/widgets/add_column_button.dart';
import 'package:kanban_application/board/widgets/primary/card_search_bar.dart';
import 'package:kanban_application/board/widgets/kanban_button.dart';

import '../../constants.dart';
import '../data.dart';
import '../widgets/primary/kanban_column.dart';


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
    var cards = await _kanban.loadKanbanCards();

    columns = await _kanban.loadKanbanColumns();

    applySettings();

    for (var card in cards) {
      columns.where((column) => column.title == card.column)
        .forEach((column) {
          column.cards.add(card);
          column.itemCount++;
        });
    }

    totalCardCount = cards.length;
    setState(() {});
  }

  void applySettings() {
    Map<String, dynamic>? settings = _kanban.loadKanbanSetting();

    if (settings == null) {
      return;
    }

    // you will have to add more settings here as needed
    _capitalText = settings[Settings.capitalText.name];
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
              buttonStateFlag: false,
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
                buttonStateFlag: _capitalText,
                icon: Icons.text_format, 
                onPressed: () {
                  setState(() {
                    _capitalText = !_capitalText;
                    _kanban.storeKanbanSettings(Settings.capitalText, _capitalText);
                  });
                }, 
                message: "capital text"
              ),
            )
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            height: MediaQuery.of(context).size.height - actionBarHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var column in columns)
                  KanbanColumn(
                    capitalText: _capitalText,
                    column: column,
                    onCardMoved: (card, newColumn) {
                      updateKanban(card, newColumn);
                    }, 
                    onColumnRemoved: () async { 
                      columns = await _kanban.loadKanbanColumns();
                      var cards = await _kanban.loadKanbanCards();

                      for (var card in cards) {
                        columns.where((column) => column.title == card.column)
                          .forEach((column) {
                            column.cards.add(card);
                            column.itemCount++;
                          });
                      }
                      setState(() {});
                    },
                  ),
                AddColumnButton(
                  onColumnAdded: () async {
                    columns = await _kanban.loadKanbanColumns();
                      var cards = await _kanban.loadKanbanCards();
                      
                      for (var card in cards) {
                        columns.where((column) => column.title == card.column)
                          .forEach((column) {
                            column.cards.add(card);
                            column.itemCount++;
                          });
                      }
                    setState(() {});
                  }
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );

  void updateKanban(KanbanCardModel card, KanbanColumnModel column) {
    final previousColumn = columns
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

    for (var column in columns) {
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
      for (var column in columns) {
        column.itemCount = column.cards.length;
      }
    });
  }
}
