import 'dart:convert';
import 'dart:html' as web;

import 'package:kanban_application/board/data.dart';
import 'package:kanban_application/board/models/kanban_column_model.dart';
import '../models/kanban_card_model.dart';

class KanbanService {
  static const _cardsKey = 'cards';
  static const _columnsKey = 'columns';

  static const _settingsKey = 'settings';

  List<KanbanCardModel> getAllCards() {
    List<KanbanCardModel> cards = [];

    for (var column in columns) {
      for (var card in column.cards) {
        cards.add(card);
      }
    }

    return cards;
  }

  void addCard(String title, String columnTitle) { 
    var column = columns.firstWhere((col) => col.title == columnTitle);
    
    var card = KanbanCardModel(
      title: title, 
      column: columnTitle,
      id: generateCardId(),
      isVisible: true,
    );
    
    column.cards.add(card);
    storeKanbanCard(card);

    totalCardCount++;
  }

  void removeCard(KanbanCardModel card) {
    var column = columns.firstWhere((col) => col.title == card.column);
    column.cards.remove(card);
    removeKanbanCard(card.id);
  }

  String generateCardId() {
    int currentCardDigitLength = totalCardCount.toString().length;
    int zeroesToAdd = 5 - currentCardDigitLength;

    return "ID${"0" * zeroesToAdd}$totalCardCount";
  }

  //-------------------------LOCAL_STORAGE_STUFF_BELOW-------------------------//

  void storeKanbanSettings(Settings setting, bool value) {
    var jsonString = web.window.localStorage[_settingsKey];

    Map<String, dynamic> settingsMap = jsonString != null ? json.decode(jsonString) : {};
    settingsMap[setting.name] = value;

    web.window.localStorage[_settingsKey] = json.encode(settingsMap);
  }

  Map<String, dynamic>? loadKanbanSetting() {
    var jsonString = web.window.localStorage[_settingsKey];
    
    if (jsonString == null) return null;

    Map<String, dynamic> settingsMap = json.decode(jsonString);
    return settingsMap;
  }

  Future storeKanbanCard(KanbanCardModel newCard) async {
    var jsonString = web.window.localStorage[_cardsKey];

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

    web.window.localStorage[_cardsKey] = json.encode({'cards': updatedCards});
  }

  Future<List<KanbanCardModel>> loadKanbanCards() async {
    String? jsonString = web.window.localStorage[_cardsKey];

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

  void removeAllCards() {
    for (var column in columns) {
      column.cards.clear();
    }

    web.window.localStorage[_cardsKey] = "";
  }

  Future<void> removeKanbanCard(String cardId) async {
    var jsonString = web.window.localStorage[_cardsKey];

    if (jsonString == null || jsonString.isEmpty) {
      return;
    }

    try {
      Map<String, dynamic> decodedData = json.decode(jsonString);
      List<dynamic> cards = decodedData['cards'];
      List<dynamic> updatedCards = cards.where((card) => card['id'] != cardId).toList();

      decodedData['cards'] = updatedCards;

      String updatedJsonString = json.encode(decodedData);

      web.window.localStorage[_cardsKey] = updatedJsonString;
    } catch (exception) {
      print('Error removing card from storage: $exception');
    }
  }

  Future<List<KanbanColumnModel>> loadKanbanColumns() async {
    var jsonString = web.window.localStorage[_columnsKey];

    if (jsonString == null || jsonString.isEmpty) {
      final initialColumns = [
        KanbanColumnModel(
          title: "todo", itemCount: 0, cards: []
        ),
        KanbanColumnModel(
          title: "in progress", itemCount: 0, cards: []
        ),
        KanbanColumnModel(
          title: "done", itemCount: 0, cards: []
        )
      ];

      web.window.localStorage[_columnsKey] = json.encode({
        'columns': initialColumns.map((column) => column.toJson()).toList()
      });

      return initialColumns;
    }

    try {
      final List<dynamic> storedColumns = json.decode(jsonString)['columns'];

      final List<KanbanColumnModel> columns = storedColumns
        .map<KanbanColumnModel>((column) => KanbanColumnModel.fromJson(column))
        .toList();

      return columns;
    } catch (exception) {
      print('Error loading kanban column: $exception');
      return [];
    }
  }

  Future<void> storeKanbanColumn(String newColumnTitle) async {
    var jsonString = web.window.localStorage[_columnsKey];

    var newColumn = KanbanColumnModel(title: newColumnTitle, itemCount: 0, cards: []);

    List<Map<String, dynamic>> columns = [];

    if (jsonString != null && jsonString.isNotEmpty) {
      columns = List<Map<String, dynamic>>.from(json.decode(jsonString)['columns']);
      
      for (var column in columns) {
        if (column['title'] == newColumnTitle) {
          return;
        }
      }
    }

    columns.add(newColumn.toJson());

    web.window.localStorage[_columnsKey] = json.encode({'columns': columns});
  }

  Future<void> removeKanbanColumn(String columnTitle) async {
    var jsonString = web.window.localStorage[_columnsKey];

    if (jsonString == null || jsonString.isEmpty) {
      return;
    }

    var columns = List<Map<String, dynamic>>.from(json.decode(jsonString)['columns']);
    columns.removeWhere((column) => column['title'] == columnTitle);

    web.window.localStorage[_columnsKey] = json.encode({'columns': columns});


    var cardsJsonString = web.window.localStorage[_cardsKey];

    if (cardsJsonString != null && cardsJsonString.isNotEmpty) {
      var cards = List<Map<String, dynamic>>.from(json.decode(cardsJsonString)['cards']);
      cards.removeWhere((card) => card['column'] == columnTitle);

      web.window.localStorage[_cardsKey] = json.encode({'cards': cards});
    }
  }
}
