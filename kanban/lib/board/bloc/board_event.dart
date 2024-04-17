import 'package:equatable/equatable.dart';
import 'package:kanban_application/board/models/kanban_card_model.dart';


abstract class BoardEvent extends Equatable {
  const BoardEvent();
  
  @override
  List<Object> get props => []; 
}

class BoardCardMovedEvent extends BoardEvent {
  const BoardCardMovedEvent(KanbanCardModel card);
}