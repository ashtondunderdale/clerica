import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:kanban_application/board/models/kanban_card_model.dart';

import '../data.dart';

class KanbanController {

  static Future<List<KanbanCardModel>> getInitialCards() async
  { 
    var jsonString = await rootBundle.loadString("cards.json");
    List<dynamic> cardsJson = json.decode(jsonString)['cards'];

    for (var cardJson in cardsJson) {

      kanbanColumnCards.add(KanbanCardModel(
        title: cardJson['Title'], 
        column: cardJson['Column'] ?? "TODO"
      ));      
    }

    return kanbanColumnCards;
  }
}