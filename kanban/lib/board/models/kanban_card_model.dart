class KanbanCardModel {
  final String title;
  String column;

  KanbanCardModel({
    required this.title,
    required this.column
  });

  Map<String, dynamic> toJson() =>
  {
    'title': title,
    'column': column,
  };
}