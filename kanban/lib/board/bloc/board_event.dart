import 'package:equatable/equatable.dart';
import 'package:kanban_application/board/models/kanban_card_model.dart';
import 'package:kanban_application/board/models/kanban_column_model.dart';


abstract class BoardEvent extends Equatable {
  const BoardEvent();
  
  @override
  List<Object> get props => []; 
}

class BoardCardMovedEvent extends BoardEvent {
  final KanbanCardModel card;
  final KanbanColumnModel newColumn;
  final KanbanColumnModel previousColumn;

  const BoardCardMovedEvent(this.card, this.newColumn, this.previousColumn);

  @override
  List<Object> get props => [card, newColumn, previousColumn]; 
}
