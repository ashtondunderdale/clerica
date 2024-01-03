class KanbanCard{

  final String parentPhase;
  final String summary;
  final String status;
  final String comments;
  final String sprint;
  final String project;
  final String assignedTo;
  final String ownedBy;
  final double storyPoints;

  KanbanCard({
    required this.parentPhase,
    required this.status, 
    required this.summary, 
    required this.comments, 
    required this.sprint, 
    required this.project, 
    required this.assignedTo, 
    required this.ownedBy,
    required this.storyPoints,
  });
}