class KanbanCardData {
  final String title;
  final String assignee;
  final String ownedBy;
  final bool isTask;
  final bool isBug;
  final bool isIssue;
  String columnTitle;

  KanbanCardData({
    required this.title,
    required this.assignee,
    required this.ownedBy,
    this.isTask = false,
    this.isBug = false,
    this.isIssue = false,
    required this.columnTitle,
  });
}

List<KanbanCardData> allCards = [
  KanbanCardData(
    title: '10.1 Identify Container Names', 
    assignee: 'Ashton Dunderdale', 
    ownedBy: "Ashton Dunderdale", 
    isTask: true,
    columnTitle: 'BACKLOG',
  ),
  KanbanCardData(
    title: '10.3 Log Results', 
    assignee: 'Ashton Dunderdale', 
    ownedBy: "Ashton Dunderdale", 
    isBug: true,
    columnTitle: 'BACKLOG',
  ),
  KanbanCardData(
    title: '11.1 Setup Kanban Project API', 
    assignee: 'Ashton Dunderdale', 
    ownedBy: "Ashton Dunderdale", 
    isTask: true,
    columnTitle: 'DEVELOPING',
  ),
  KanbanCardData(
    title: '10.4 Centralise', 
    assignee: 'Ashton Dunderdale', 
    ownedBy: "Ashton Dunderdale", 
    isBug: true,
    columnTitle: 'DEVELOPED',
  ),
  KanbanCardData(
    title: '10.2 Identify Container Names', 
    assignee: 'Ashton Dunderdale', 
    ownedBy: "Ashton Dunderdale", 
    isTask: true,
    columnTitle: 'TESTING',
  ),
];

List<KanbanCardData> getCardsByColumn(String columnTitle) {
  return allCards.where((card) => card.columnTitle == columnTitle).toList();
}