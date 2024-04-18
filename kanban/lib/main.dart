import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'board/bloc/board_bloc.dart';
import 'board/views/kanban.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BoardBloc>(
      create: (context) => BoardBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Kanban(),
      ),
    );
  }
}
