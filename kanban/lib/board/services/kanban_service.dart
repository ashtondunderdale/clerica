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
    //saveKanbanData(card);

    totalCardCount++;
  }

  void removeCard(KanbanCardModel card) {
    var column = kanbanColumns.firstWhere((col) => col.title == card.column);
    column.cards.remove(card);
  }

  Future<void> saveKanbanData(KanbanCardModel kanbanData) async {
    print("saving data");


    String data = '{"cards":[{"title":"card1","column":"TODO", "id":"K00000"},{"title":"card2","column":"IN PROGRESS", "id":"K00001"}]}';
    web.window.localStorage[_storageKey] = data;
    print(web.window.localStorage[_storageKey]);
  }

Future<List<KanbanCardModel>> loadKanbanData() async {
  String? jsonString = web.window.localStorage[_storageKey];

  if (jsonString == null || jsonString.isEmpty) {
    return [];
  }

  try {
    final decodedData = json.decode(jsonString);
    final List<dynamic> cards = decodedData['cards'];
    final List<KanbanCardModel> pulledCards = [];
      print(cards[0]);

    for (var card in cards) {
      var newCard = KanbanCardModel(
        title: card['title'] ?? "null",
        column: card['column'] ?? "null",
        id: card['id'] ?? "null",
        isVisible: true,
      );

      pulledCards.add(newCard);
    }

    return pulledCards;
  } catch (exception) {
    print(exception);
    return [];
  }
}




  String generateCardId() {
    // first ID: K00000, then K00001...
    int currentCardDigitLength = totalCardCount.toString().length;
    int zeroesToAdd = 5 - currentCardDigitLength;

    return "ID${"0" * zeroesToAdd}$totalCardCount";
  }
}
