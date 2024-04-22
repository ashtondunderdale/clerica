import '../data.dart';

class KanbanCardModel {
  String title;
  String column;
  String id;
  bool isVisible;
  CardType cardType;

  KanbanCardModel({
    required this.title,
    required this.column,
    required this.id,
    required this.isVisible,
    required this.cardType
  });

  Map<String, dynamic> toJson() =>
  {
    'title': title,
    'column': column,
    'id': id,
    'isVisible': true,
    'cardType': cardType
  };
}