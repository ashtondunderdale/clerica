import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';
import '../bloc/board_bloc.dart';
import '../bloc/board_event.dart';
import '../models/kanban_card_model.dart';


class KanbanCard extends StatelessWidget {
  const KanbanCard({super.key, required this.card});

  final KanbanCardModel card;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(secondaryPaddingValue),
    child: GestureDetector(
      onTap: () {
        BlocProvider.of<BoardBloc>(context).add(
          BoardCardMovedEvent(card),
        );
      },
      child: Container(
        width: kanbanCardWidth,
        height: kanbanCardHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadiusValue),
          color: mediumGrey
        ),
        child:_buildText(card.title)
      ),
    ),
  );

  Widget _buildText(String text) => Padding(
    padding: const EdgeInsets.all(secondaryPaddingValue),
    child: Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold, 
        color: darkGrey, 
        fontSize: smallTextFontSize
      ),
    ),
  );
}