import 'dart:convert';
import 'dart:html' as web;

import 'package:kanban_application/board/data.dart';
import 'package:kanban_application/board/models/kanban_column_model.dart';

import '../models/kanban_card_model.dart';

class KanbanService {
  static const _storageKey = 'kanbanData';

  void addNewCard(String title, String columnTitle) {
    KanbanColumnModel column = kanbanColumns.where((col) => col.title == columnTitle).first;
    column.cards.add(KanbanCardModel(title: title, column: columnTitle));
  }

  Future<void> saveKanbanData(KanbanCardModel card) async {
    final jsonString = web.window.localStorage[_storageKey];
    List<KanbanCardModel> kanbanData = [];

    if (jsonString == null) return;

    final decodedData = json.decode(jsonString);
    final List<dynamic> cardsJson = decodedData['cards'];

    kanbanData = cardsJson.map((cardJson) => KanbanCardModel(
        title: cardJson['title'],
        column: cardJson['column'] ?? "TODO",
      ))
    .toList();

    bool cardExists = false;
    for (var existingCard in kanbanData) {
      if (existingCard.title == card.title) {
        existingCard.column = card.column;
        cardExists = true;

        break;
      }
    }

    if (!cardExists) {
      kanbanData.add(card);
    }

    final List<Map<String, dynamic>> jsonData =
        kanbanData.map((card) => card.toJson()).toList();

    final updatedJsonString = json.encode({'cards': jsonData});
    web.window.localStorage[_storageKey] = updatedJsonString;
  }

  Future<List<KanbanCardModel>> loadKanbanData() async {
    final jsonString = web.window.localStorage[_storageKey];

    if (jsonString == null) return [];

    final decodedData = json.decode(jsonString);
    final List<dynamic> cardsJson = decodedData['cards'];

    return cardsJson
        .map((cardJson) => KanbanCardModel(
              title: cardJson['title'],
              column: cardJson['column'] ?? "TODO",
            ))
        .toList();
  }
}
