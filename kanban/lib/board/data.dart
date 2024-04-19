import 'models/kanban_card_model.dart';
import 'models/kanban_column_model.dart';


List<String> kanbanColumnTitles = [
  "TODO",
  "IN PROGRESS",
  "DONE",
  "FUTURE"
];

List<KanbanCardModel> kanbanColumnCards = [];

List<KanbanColumnModel> kanbanColumns = kanbanColumnTitles.map((title) => KanbanColumnModel(
  title: title, itemCount: 0, cards: []
)).toList();

