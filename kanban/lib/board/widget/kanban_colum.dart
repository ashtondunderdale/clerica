import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';
import '../bloc/board_bloc.dart';
import '../bloc/board_event.dart';
import '../models/kanban_card_model.dart';
import '../models/kanban_column_model.dart';
import 'kanban_card.dart';


class KanbanColumn extends StatefulWidget {
  const KanbanColumn({super.key, required this.column});

  final KanbanColumnModel column;

  @override
  State<KanbanColumn> createState() => _KanbanColumnState();
}

class _KanbanColumnState extends State<KanbanColumn> {
  @override
  Widget build(BuildContext context) => _buildColumn(context, widget.column.title);

  Widget _buildColumn(BuildContext context, String title) => Padding(
    padding: const EdgeInsets.all(primaryPaddingValue),
    child: DragTarget<KanbanCardModel>(
      onAcceptWithDetails: (card) {
        BlocProvider.of<BoardBloc>(context).add(
          BoardCardMovedEvent(card.data, widget.column.title),
        );
      },
      onWillAccept: (data) => true,
      builder: (context, candidateData, rejectedData) => Container(
        width: kanbanColumnWidth,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: lightGrey,
          borderRadius: BorderRadius.circular(borderRadiusValue)),
        child: Padding(
          padding: const EdgeInsets.all(primaryPaddingValue),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: primaryPaddingValue, right: primaryPaddingValue, bottom: primaryPaddingValue*2),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildText(title),
                    Spacer(),
                    _buildText(widget.column.itemCount.toString()),
                  ],
                ),
              ),
              _buildCards(widget.column.cards),
            ],
          ),
        ),
      ),
    ),
  );

  Widget _buildCards(List<KanbanCardModel> cards) => Column(
    children: cards.map((card) => KanbanCard(card: card)).toList()
  );

  Widget _buildText(String text) => Text(
    text,
    style: TextStyle(
      fontWeight: FontWeight.w500, 
      color: darkGrey, 
      fontSize: smallTextFontSize
    ),
  );
}