import 'models/kanban_card_model.dart';
import 'models/kanban_column_model.dart';


List<String> kanbanColumnTitles = [
  "TODO",
  "IN PROGRESS",
  "DONE"
];

List<KanbanCardModel> kanbanColumnCards = [
    KanbanCardModel(title: "A project", column: "TODO"),
    KanbanCardModel(title: "another project", column: "TODO"),
  
  
    KanbanCardModel(title: "a project in progress", column: "IN PROGRESS"),
    KanbanCardModel(title: "test", column: "IN PROGRESS"),
    KanbanCardModel(title: "TEST!!!", column: "IN PROGRESS"),
    KanbanCardModel(title: "another project 2", column: "IN PROGRESS"),
  
  
    KanbanCardModel(title: "DONE!!!!!", column: "DONE")
  
];

List<KanbanColumnModel> kanbanColumns = kanbanColumnTitles.map((title) {
  List<KanbanCardModel> columnCards = kanbanColumnCards.where((card) => card.column == title).toList();
  
  return KanbanColumnModel(
    title: title,
    itemCount: columnCards.length,
    cards: columnCards,
  );
}).toList();

