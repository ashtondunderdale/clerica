import 'dart:convert';
import 'dart:html' as web;

import '../data.dart';
import '../models/kanban_card_model.dart';

class KanbanController {

  static const _storageKey = 'kanbanData';

  static Future<void> saveKanbanData(String kanbanData) async {
    
    

    kanbanData = '{"cards":[{"title":"card1","column":"TODO"},{"title":"card2","column":"IN PROGRESS"}]}';
    web.window.localStorage[_storageKey] = kanbanData;
  }

  static Future<List<KanbanCardModel>> loadKanbanData() async {
    final jsonString = web.window.localStorage[_storageKey];

    if (jsonString == null) return []; 

      final decodedData = json.decode(jsonString);
      final List<dynamic> cardsJson = decodedData['cards'];

      for (var cardJson in cardsJson) {
        kanbanColumnCards.add(KanbanCardModel(
          title: cardJson['title'], 
          column: cardJson['column'] ?? "TODO",
        ));      
      }

      return kanbanColumnCards;
  }
}