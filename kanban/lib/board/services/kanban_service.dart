import 'dart:convert';
import 'dart:html' as web;

import 'package:kanban_application/board/data.dart';
import 'package:kanban_application/board/models/kanban_column_model.dart';
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

  void removeAllCards() {       //TODO: FINISH THIS
    for (var column in kanbanColumns) {
      column.cards.clear();
    }
  }

  void addCard(String title, KanbanColumnModel column) { 
    
    var card = KanbanCardModel(
      title: title, 
      column: column.title,
      id: generateCardId(),
      isVisible: true,
      cardType: CardType.none,
    );

    totalCardCount++;
    column.cards.add(card);
    
    storeKanbanCard(card);
  }

  void removeCard(KanbanCardModel card) {
    var column = kanbanColumns.firstWhere((col) => col.title == card.column);
    column.cards.remove(card);

    removeKanbanCard(card.id);
  }

  String generateCardId() {
    int currentCardDigitLength = totalCardCount.toString().length;
    int zeroesToAdd = 5 - currentCardDigitLength;

    return "ID${"0" * zeroesToAdd}$totalCardCount";
  }

  //-------------------------LOCAL_STORAGE_STUFF_BELOW-------------------------//


  Future<void> storeKanbanCard(KanbanCardModel newCard) async {
    var cardJson = _getStorageJson();

    List<Map<String, dynamic>> updatedCards = [];
    final List<dynamic> cards = cardJson['cards'];

    for (var card in cards) {
      if (card['id'] == newCard.id) {
        card['title'] = newCard.title;
        card['column'] = newCard.column;
        card['cardType'] = newCard.cardType.name;
        updatedCards.add(card);
      } else {
        updatedCards.add(card);
      }
    }

    if (!updatedCards.any((card) => card['id'] == newCard.id)) {
      updatedCards.add({
        'title': newCard.title,
        'column': newCard.column,
        'id': newCard.id,
        'cardType': newCard.cardType.name
      });
    }

    _setStorageJson(jsonEncode({'cards': updatedCards}));
  }


  Future<List<KanbanCardModel>> loadKanbanData() async {
    dynamic cardJson = _getStorageJson();

    final List<dynamic> storedCards = cardJson['cards'];
    final List<KanbanCardModel> cards = [];

    for (var card in storedCards) {
      cards.add(KanbanCardModel(
        title: card['title'] ?? "null",
        column: card['column'] ?? "null",
        id: card['id'] ?? "null",
        isVisible: true,
        cardType: CardType.values.firstWhere((e) => e.name == card['cardType'])
      ));
    }

    return cards;
  }

  Future<void> removeKanbanCard(String cardId) async {
    dynamic cardJson = _getStorageJson();

    List<dynamic> cards = cardJson['cards'];
    cardJson['cards'] = cards.where((card) => card['id'] != cardId).toList();

    _setStorageJson(json.encode(cardJson));
  }


  dynamic _getStorageJson() => jsonDecode(web.window.localStorage[_storageKey] ?? "null");

  void _setStorageJson(String val) => web.window.localStorage[_storageKey] = val;
}
