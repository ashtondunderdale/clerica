import 'models/kanban_card_model.dart';
import 'models/kanban_column_model.dart';


List<String> kanbanColumnTitles = [
  "TODO",
  "IN PROGRESS",
  "DONE"
];

List<List<KanbanCardModel>> kanbanColumnCards = [
  [
    KanbanCardModel(title: "A project"),
    KanbanCardModel(title: "another project"),
  ],
  [
    KanbanCardModel(title: "a project in progress"),
    KanbanCardModel(title: "test"),
    KanbanCardModel(title: "TEST!!!"),
    KanbanCardModel(title: "another project 2"),
  ],
  [
    KanbanCardModel(title: "DONE!!!!!")
  ],
];

List<KanbanColumnModel> kanbanColumns = List.generate(
  kanbanColumnTitles.length, (index) => KanbanColumnModel(
    title: kanbanColumnTitles[index],
    itemCount: kanbanColumnCards[index].length,
    cards: kanbanColumnCards[index],
  )
);
