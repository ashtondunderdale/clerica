import 'kanban_card_model.dart';


class KanbanColumnModel {
  final String title;
  int itemCount;
  List<KanbanCardModel> cards;

  KanbanColumnModel({
    required this.title, 
    required this.itemCount,
    required this.cards
  });
}