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
  KanbanColumnData(title: columnTitles[0], cards: [
    KanbanCard(summary: "backlog 1"),
    KanbanCard(summary: "backlog 2")
    ]
  ),

  KanbanColumnData(title: columnTitles[1], cards: [
    KanbanCard(summary: "developing 1"),
    KanbanCard(summary: "developing 2"),
    KanbanCard(summary: "developing 3")
    ]
  ),

  KanbanColumnData(title: columnTitles[2], cards: [
    KanbanCard(summary: "developed 1")
    ]
  ),

  KanbanColumnData(title: columnTitles[3], cards: [
    KanbanCard(summary: "testing 1"),
    KanbanCard(summary: "testing 2"),
    KanbanCard(summary: "testing 3"),
    KanbanCard(summary: "testing 4"),
    KanbanCard(summary: "testing 5"),
    KanbanCard(summary: "testing 6"),

    ]
  ),

  KanbanColumnData(title: columnTitles[4], cards: [
    KanbanCard(summary: "tested 1"),
    ]
  ),

  KanbanColumnData(title: columnTitles[5], cards: [
    KanbanCard(summary: "done 1"),
    KanbanCard(summary: "done 2"),
    ]
  ),
];
