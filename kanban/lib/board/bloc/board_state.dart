import 'package:equatable/equatable.dart';

import '../models/kanban_card_model.dart';
import '../models/kanban_column_model.dart';


abstract class BoardState extends Equatable {
  const BoardState();
  
  @override
  List<Object> get props => [];
}

class BoardInitial extends BoardState {}

class BoardCardMovedState extends BoardState {
  final KanbanCardModel card;
  final KanbanColumnModel newColumn;
  final KanbanColumnModel previousColumn;

  const BoardCardMovedState(this.card, this.newColumn, this.previousColumn);
}