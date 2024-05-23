class KanbanCardModel {
  String title;
  String column;
  String id;
  bool isVisible;

  KanbanCardModel({
    required this.title,
    required this.column,
    required this.id,
    required this.isVisible
  });

  factory KanbanCardModel.fromJson(Map<String, dynamic> json) {
    return KanbanCardModel(
      title: json['title'],
      column: json['column'], 
      id: json['id'], 
      isVisible: true
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'column': column,
      'id': id,
      'isVisible': isVisible
    };
  }
}