import 'dart:convert';
import 'dart:html' as web;

import 'package:kanban_application/board/data.dart';

import '../models/kanban_card_model.dart';

class KanbanService {
  static const _storageKey = 'kanban';

  List<KanbanCardModel> getAllCards() {
    List<KanbanCardModel> cards = [];

    for (var column in kanbanColumns) {
      for (var card in column.cards) {
        cards.add(card);
      }
    }

    return cards;
  }

  void addNewCard(String title, String columnTitle) { 
    var column = kanbanColumns.firstWhere((col) => col.title == columnTitle);
    
    var card = KanbanCardModel(
      title: title, 
      column: columnTitle,
      id: generateCardId(),
      isVisible: true
    );
    
    column.cards.add(card);
    saveKanbanData(card);

    totalCardCount++;
  }

  void removeCard(KanbanCardModel card) {
    var column = kanbanColumns.firstWhere((col) => col.title == card.column);
    column.cards.remove(card);
    removeKanbanData(card.id);
  }

  String generateCardId() {
    int currentCardDigitLength = totalCardCount.toString().length;
    int zeroesToAdd = 5 - currentCardDigitLength;

    return "ID${"0" * zeroesToAdd}$totalCardCount";
  }

  //-------------------------LOCAL_STORAGE_STUFF_BELOW-------------------------//

  Future<void> saveKanbanData(KanbanCardModel newCard) async {
    var jsonString = web.window.localStorage[_storageKey];

    List<Map<String, dynamic>> updatedCards = [];

    if (jsonString != null && jsonString.isNotEmpty) {
      final decodedData = json.decode(jsonString);
      final List<dynamic> cards = decodedData['cards'];

      for (var card in cards) {
        if (card['id'] == newCard.id) {
          card['title'] = newCard.title;
          card['column'] = newCard.column;
          updatedCards.add(card);
        } else {
          updatedCards.add(card);
        }
      }
    }

    if (!updatedCards.any((card) => card['id'] == newCard.id)) {
      updatedCards.add({
        'title': newCard.title,
        'column': newCard.column,
        'id': newCard.id,
      });
    }

    web.window.localStorage[_storageKey] = json.encode({'cards': updatedCards});
  }


  Future<List<KanbanCardModel>> loadKanbanData() async {
    String? jsonString = web.window.localStorage[_storageKey];

    if (jsonString == null || jsonString.isEmpty) {
      return [];
    }

    try {
      final List<dynamic> storedCards = json.decode(jsonString)['cards'];
      final List<KanbanCardModel> cards = [];

      for (var card in storedCards) {
        cards.add(KanbanCardModel(
          title: card['title'] ?? "null",
          column: card['column'] ?? "null",
          id: card['id'] ?? "null",
          isVisible: true,
        ));
      }

      return cards;
    } catch (exception) {
      print('Error loading data from storage: $exception');
      return [];
    }
  }

Future<void> removeKanbanData(String cardId) async {
  var jsonString = web.window.localStorage[_storageKey];

  if (jsonString != null && jsonString.isNotEmpty) {
    try {
      Map<String, dynamic> decodedData = json.decode(jsonString);
      List<dynamic> cards = decodedData['cards'];
      List<dynamic> updatedCards = cards.where((card) => card['id'] != cardId).toList();

      decodedData['cards'] = updatedCards;

      String updatedJsonString = json.encode(decodedData);

      web.window.localStorage[_storageKey] = updatedJsonString;
    } catch (exception) {
      print('Error removing card from storage: $exception');
    }
  }
}

}
