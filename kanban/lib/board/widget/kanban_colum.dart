import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kanban_application/board/widget/add_card_button.dart';

import '../../constants.dart';
import '../models/kanban_card_model.dart';
import '../models/kanban_column_model.dart';
import 'kanban_card.dart';


class KanbanColumn extends StatefulWidget {
  const KanbanColumn({Key? key, required this.column, required this.onCardMoved});

  final KanbanColumnModel column;
  final Function(KanbanCardModel, KanbanColumnModel) onCardMoved;

  @override
  State<KanbanColumn> createState() => _KanbanColumnState();
}

class _KanbanColumnState extends State<KanbanColumn> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) => _buildColumn(context, widget.column.title);

  Widget _buildColumn(BuildContext context, String title) => Padding(
    padding: const EdgeInsets.all(primaryPaddingValue),
    child: DragTarget<KanbanCardModel>(
      onAcceptWithDetails: (card) => widget.onCardMoved(card.data, widget.column),
      builder: (context, candidateData, rejectedData) => MouseRegion(
        onEnter: (enter) {
          setState(() => _isHovered = true);
        },
        onExit: (exit) {
          setState(() => _isHovered = false);
        },
        child: Container(
          width: kanbanColumnWidth,
          height: null,
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
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        _buildCards(widget.column.cards),
                          _isHovered ? AddCardButton(
                          column: widget.column, 
                          onCardAdded: () {
                            widget.column.itemCount = widget.column.cards.length;
                            setState(() {});
                          }
                        ) : SizedBox(),
                      ],
                    )
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );

  Widget _buildCards(List<KanbanCardModel> cards) => Column(
    children: cards.map((card) => KanbanCard(
      card: card, 
      onCardRemoved: () { 
        widget.column.itemCount = widget.column.cards.length;
        setState(() {});
      }
    )).toList(),
  );

  Widget _buildText(String text) => Text(
    text.replaceAll('_', ' ').toUpperCase(),
    style: TextStyle(
      fontWeight: FontWeight.w500, 
      color: veryDarkGrey, 
      fontSize: smallTextFontSize
    ),
  );
}