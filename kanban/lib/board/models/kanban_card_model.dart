enum Categories {
  maths,
  programming
}

class KanbanCardModel {
  String title;
  String column;
  String id;
  bool isVisible;
  List<Categories> categories;

  KanbanCardModel({
    required this.title,
    required this.column,
    required this.id,
    required this.isVisible,
    required this.categories
  });

  Map<String, dynamic> toJson() =>
  {
    'title': title,
    'column': column,
    'id': id,
    'isVisible': true,
    'categories': categories
  };
}