class KanbanCardData {
  final String title;
  final String assignee;
  final String ownedBy;
  final bool isTask;
  final bool isBug;
  final bool isIssue;

  KanbanCardData({
    required this.title,
    required this.assignee,
    required this.ownedBy,
    this.isTask = false,
    this.isBug = false,
    this.isIssue = false,
  });
}

List<KanbanCardData> backlogCards = [
  KanbanCardData(title: '10.1 Identify Container Names', assignee: 'Ashton Dunderdale', ownedBy: "Ashton Dunderdale", isTask: true),
  KanbanCardData(title: '10.3 Log Results', assignee: 'Ashton Dunderdale', ownedBy: "Ashton Dunderdale", isBug: true),
];

List<KanbanCardData> developingCards = [
  KanbanCardData(title: '11.1 Setup Kanban Project API', assignee: 'Ashton Dunderdale', ownedBy: "Ashton Dunderdale", isTask: true),
  KanbanCardData(title: '10.3 Log Results', assignee: 'Ashton Dunderdale', ownedBy: "Ashton Dunderdale", isIssue: true),
];

List<KanbanCardData> developedCards = [
  KanbanCardData(title: '10.4 Centralise', assignee: 'Ashton Dunderdale', ownedBy: "Ashton Dunderdale", isBug: true),];

List<KanbanCardData> testingCards = [
  KanbanCardData(title: '10.1 Identify Container Names', assignee: 'Ashton Dunderdale', ownedBy: "Ashton Dunderdale", isTask: true),
  KanbanCardData(title: '10.4 Log Results', assignee: 'Ashton Dunderdale', ownedBy: "Ashton Dunderdale", isBug: true),
  KanbanCardData(title: '10.2 Identify Container Names', assignee: 'Ashton Dunderdale', ownedBy: "Ashton Dunderdale", isTask: true),
  KanbanCardData(title: '10.5 Log Results', assignee: 'Ashton Dunderdale', ownedBy: "Ashton Dunderdale", isBug: true),
];

List<KanbanCardData> testedCards = [
];

List<KanbanCardData> doneCards = [
];

// issues: yellow
// bugs:   red
// 