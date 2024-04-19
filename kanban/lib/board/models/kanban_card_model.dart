class KanbanCardModel {
  final String title;
  String column;
  String id;

  KanbanCardModel({
    required this.title,
    required this.column,
    required this.id
  });

  Map<String, dynamic> toJson() =>
  {
    'title': title,
    'column': column,
    'id': id
  };
}