import 'dart:convert';
import 'dart:html' as web;

import 'package:kanban_application/board/data.dart';

import '../models/kanban_card_model.dart';

class KanbanService {
  static const _storageKey = 'kanbanData';

  void addNewCard(String title, String columnTitle) {
    var column = kanbanColumns.firstWhere((col) => col.title == columnTitle);
    
    column.cards.add(KanbanCardModel(
      title: title, 
      column: columnTitle
    ));
  }

  void removeCard(KanbanCardModel card) {
    var column = kanbanColumns.firstWhere((col) => col.title == card.column);
    column.cards.remove(card);
  }

  Future saveKanbanData(KanbanCardModel card) async {
    final jsonString = web.window.localStorage[_storageKey];
    List<KanbanCardModel> kanbanData = [];

    if (jsonString == null) return;

    final List<dynamic> cards = json.decode(jsonString)['cards'];

    kanbanData = cards.map((card) => KanbanCardModel(
      title: card['title'],
      column: card['column'] ?? "TODO",
    )).toList();

    bool cardExists = false;
    for (var existingCard in kanbanData) {
      if (existingCard.title == card.title) {
        existingCard.column = card.column;
        cardExists = true;
        break;
      }
    }

    if (!cardExists) kanbanData.add(card);

    final List<Map<String, dynamic>> jsonData =
        kanbanData.map((card) => card.toJson()).toList();

    final updatedJsonString = json.encode({'cards': jsonData});
    web.window.localStorage[_storageKey] = updatedJsonString;
  }

  Future<List<KanbanCardModel>> loadKanbanData() async {
    final jsonString = web.window.localStorage[_storageKey];

    if (jsonString == null) return [];

    final List<dynamic> cards = json.decode(jsonString)['cards'];

    return cards.map((card) => KanbanCardModel(
      title: card['title'],
      column: card['column'] ?? "TODO",
    )).toList();
  }
}
