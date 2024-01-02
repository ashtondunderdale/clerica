import '../widgets/kanban_card.dart';

class KanbanColumnData {
  final String title;
  List<KanbanCard> cards;

  KanbanColumnData({required this.title, required this.cards});
}

String loggedInUser = "";

final List<String> columnTitles = [
  'BACKLOG',
  'DEVELOPING',
  'DEVELOPED',
  'TESTING',
  'TESTED',
  'DONE',
];

final List<KanbanColumnData> kanbanData = [
  KanbanColumnData(title: 'BACKLOG', cards: [
    KanbanCard(status: "status", summary: "summary", comments: "comments", sprint: "Sprint 17", project: "Internal Applications")
  ]),
  KanbanColumnData(title: 'DEVELOPING', cards: []),
  KanbanColumnData(title: 'DEVELOPED', cards: []),
  KanbanColumnData(title: 'TESTING', cards: []),
  KanbanColumnData(title: 'TESTED', cards: []),
  KanbanColumnData(title: 'DONE', cards: []),
];

