class KanbanCard{

  final String summary;
  final String status;
  final String comments;
  final String sprint;
  final String project;
  final String assignedTo;
  final String ownedBy;

  KanbanCard({
    required this.status, 
    required this.summary, 
    required this.comments, 
    required this.sprint, 
    required this.project, 
    required this.assignedTo, 
    required this.ownedBy
  });
}