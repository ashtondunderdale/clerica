import 'models/kanban_column_model.dart';


enum KanbanTitles {
  future,
  todo,
  in_progress,
  done,
  deferred
}


List<String> addCardMessages = [
  "what needs to be done?",
  "describe your task",
  "what's up next?"
];

int totalCardCount = 0;

List<KanbanColumnModel> kanbanColumns = KanbanTitles.values.map((title) => KanbanColumnModel(
  title: title.name, itemCount: 0, cards: []
)).toList();