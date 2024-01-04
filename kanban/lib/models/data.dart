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

final List<String> developmentProjects = [
  "AP Automation",
  "SFDC",
  "Alberta Quoting System",
  "Epicor Work",
  "Installers App",
  "License Portal",
  "License API",
  "Mobile Field Service Web API",
  "Mobile Field Service App API",
  "MIMS",
  "Dev Ops",
  "Epicor Parameters Screen",
  "PO Approval",
  "Proof of Delivery",
  "Epicor Printing Service",
  "Requsisition Enahncements",
  "GHA Scheduling Module",
  "Internal Applications",
  "Web Applications Common",
];