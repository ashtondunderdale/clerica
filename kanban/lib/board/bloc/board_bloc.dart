import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/kanban_card_model.dart';
import 'board_event.dart';
import 'board_state.dart';


class BoardBloc extends Bloc<BoardEvent, BoardState> {
  BoardBloc() : super(BoardInitial()) {
    on<BoardCardMovedEvent>(_moveCard);
  }

  void _moveCard(BoardCardMovedEvent event, Emitter<BoardState> emit) {
    final KanbanCardModel card = event.card;
    final String destinationTitle = event.destinationTitle;

    card.column = destinationTitle;

    emit(BoardCardMovedState(card));
  }
}
