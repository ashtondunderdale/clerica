import '../widgets/kanban_card.dart';

class KanbanColumnData {
  final String title;
  final List<KanbanCard> cards;

  KanbanColumnData({required this.title, required this.cards});
}

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
    KanbanCard(summary: "this is a task 1"),
    KanbanCard(summary: "this is a bug"),
    ]
  ),

  KanbanColumnData(title: 'DEVELOPING', cards: [
    KanbanCard(summary: "this is another task"),
    KanbanCard(summary: "this is a bug"),
    KanbanCard(summary: "this is a bug"),
    ]
  ),

  KanbanColumnData(title: 'DEVELOPED', cards: [
    KanbanCard(summary: "this is another task"),
    ]
  ),

  KanbanColumnData(title: 'TESTING', cards: [
    KanbanCard(summary: "this is a bug"),
    KanbanCard(summary: "this is another task 2"),
    KanbanCard(summary: "this is a bug"),
    KanbanCard(summary: "this is a task with a very long name to test how well it fits on the card"),
    KanbanCard(summary: "this is a task 2"),
    KanbanCard(summary: "this is also a task 1"),

    ]
  ),

  KanbanColumnData(title: 'TESTED', cards: [
    KanbanCard(summary: "this is a bug"),
    KanbanCard(summary: "task 2"),
    ]
  ),

  KanbanColumnData(title: 'DONE', cards: [
    KanbanCard(summary: "task 1"),
    ]
  ),
];
