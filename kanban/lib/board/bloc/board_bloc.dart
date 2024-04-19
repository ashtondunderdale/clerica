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

    event.newColumn.itemCount = event.newColumn.cards.length;
    event.previousColumn.itemCount = event.previousColumn.cards.length;

    emit(BoardCardMovedState(event.card, event.newColumn, event.previousColumn));
  }
}
