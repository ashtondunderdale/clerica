import 'models/kanban_column_model.dart';


List<String> kanbanColumnTitles = [
  "TODO",
  "IN PROGRESS",
  "DONE",
  "FUTURE"
];

List<String> addCardMessages = [
  "what needs to be done?",
  "describe your task",
];

List<KanbanColumnModel> kanbanColumns = kanbanColumnTitles.map((title) => KanbanColumnModel(
  title: title, itemCount: 0, cards: []
)).toList();