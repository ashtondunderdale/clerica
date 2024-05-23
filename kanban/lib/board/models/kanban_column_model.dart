import 'kanban_card_model.dart';


class KanbanColumnModel {
  String title;
  int itemCount;
  List<KanbanCardModel> cards;

  KanbanColumnModel({
    required this.title,
    required this.itemCount,
    required this.cards,
  });

  factory KanbanColumnModel.fromJson(Map<String, dynamic> json) {
    return KanbanColumnModel(
      title: json['title'],
      itemCount: json['itemCount'],
      cards: (json['cards'] as List<dynamic>)
          .map((cardJson) => KanbanCardModel.fromJson(cardJson))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'itemCount': itemCount,
      'cards': cards.map((card) => card.toJson()).toList(),
    };
  }
}