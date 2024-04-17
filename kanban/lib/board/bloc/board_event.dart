import 'package:equatable/equatable.dart';
import 'package:kanban_application/board/models/kanban_card_model.dart';


abstract class BoardEvent extends Equatable {
  const BoardEvent();
  
  @override
  List<Object> get props => []; 
}

class BoardCardMovedEvent extends BoardEvent {
  final KanbanCardModel card;
  final String destinationTitle;

  const BoardCardMovedEvent(this.card, this.destinationTitle);
}
