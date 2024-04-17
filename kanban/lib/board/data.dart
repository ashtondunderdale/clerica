import 'package:kanban_application/board/models/kanban_column_model.dart';

List<String> kanbanColumnTitles = [
  "TODO",
  "IN PROGRESS",
  "DONE"
];

List<KanbanColumnModel> kanbanColumns = kanbanColumnTitles.map((title) {
  return KanbanColumnModel(title: title, itemCount: 0);
}).toList();
