import 'package:equatable/equatable.dart';

import '../models/kanban_card_model.dart';


abstract class BoardState extends Equatable {
  const BoardState();
  
  @override
  List<Object> get props => [];
}

class BoardInitial extends BoardState {}

class BoardCardMovedState extends BoardState {
  final KanbanCardModel card;

  const BoardCardMovedState(this.card);
}