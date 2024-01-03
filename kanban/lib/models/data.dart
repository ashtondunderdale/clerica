import 'kanban_card.dart';

class KanbanColumnData {
  final String title;
  List<KanbanCard> cards;

  KanbanColumnData({required this.title, required this.cards});
}

String loggedInUser = "";

final Map<String,String> users  = {
  "proden"      : "Peter Roden",
  "jsweeney"    : "Josh Sweeney",
  "bwojda"      : "Bart Wojda",
  "adunderdale" : "Ashton Dunderdale",
  "holeary"     : "Harrison O'Leary",
  "cglover"     : "Charlie Glover",
};


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
    title: columnTitles[0], 
    cards: []
  ),
  KanbanColumnData(
    title: columnTitles[1], 
    cards: []
  ),
  KanbanColumnData(
    title: columnTitles[2], 
    cards: []
  ),
  KanbanColumnData(
    title: columnTitles[3], 
    cards: []
  ),
  KanbanColumnData(
    title: columnTitles[4], 
    cards: []
  ),
  KanbanColumnData(
    title: columnTitles[5], 
    cards: []
  ),
];

