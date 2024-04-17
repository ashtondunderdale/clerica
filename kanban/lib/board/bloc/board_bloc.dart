import 'package:flutter_bloc/flutter_bloc.dart';

import 'board_event.dart';
import 'board_state.dart';


class BoardBloc extends Bloc<BoardEvent, BoardState> {
  BoardBloc() : super(BoardInitial()) {
    on<BoardCardMovedEvent>(_moveCard);
  }

  void _moveCard(BoardCardMovedEvent event, Emitter<BoardState> emit) {
    
  }
}
