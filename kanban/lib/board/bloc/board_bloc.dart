import 'package:flutter_bloc/flutter_bloc.dart';
import 'board_event.dart';
import 'board_state.dart';


class BoardBloc extends Bloc<BoardEvent, BoardState> {
  BoardBloc() : super(BoardInitial()) {
    on<BoardCardMovedEvent>(_moveCard);
  }

  void _moveCard(BoardCardMovedEvent event, Emitter<BoardState> emit) {
    event.card.column = event.newColumn.title;

    event.previousColumn.cards.remove(event.card);
    event.newColumn.cards.add(event.card);

    emit(BoardCardMovedState(event.card));
  }
}
