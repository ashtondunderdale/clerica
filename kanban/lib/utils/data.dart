import '../widgets/kanban_card.dart';

class KanbanColumnData {
  final String title;
  List<KanbanCard> cards;

  KanbanColumnData({required this.title, required this.cards});
}

final Map<String,String> users  = {
  "proden"       : "Peter Roden",
  "jsweeney"     : "Josh Sweeney",
  "bwojda"       : "Bart Wojda",
  "adunderdale"  : "Ashton Dunderdale",
  "ho'leary"     : "Harrison O'Leary",
  "cglover"      : "Charlie Glover",
};

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
  KanbanColumnData(
    title: 'BACKLOG', 
    cards: []
  ),
  KanbanColumnData(
    title: 'DEVELOPING', 
    cards: []
  ),
  KanbanColumnData(
    title: 'DEVELOPED', 
    cards: []
  ),
  KanbanColumnData(
    title: 'TESTING', 
    cards: []
  ),
  KanbanColumnData(
    title: 'TESTED', 
    cards: []
  ),
  KanbanColumnData(
    title: 'DONE', 
    cards: []
  ),
];

