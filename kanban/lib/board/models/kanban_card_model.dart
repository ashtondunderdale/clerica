import '../data.dart';

class KanbanCardModel {
  String title;
  String column;
  String id;
  bool isVisible;

  KanbanCardModel({
    required this.title,
    required this.column,
    required this.id,
    required this.isVisible
  });
}