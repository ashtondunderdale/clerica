import 'package:flutter/material.dart';

import '../../constants.dart';
import '../models/kanban_card_model.dart';


class KanbanCard extends StatefulWidget {
  const KanbanCard({Key? key, required this.card});

  final KanbanCardModel card;

  @override
  State<KanbanCard> createState() => _KanbanCardState();
}

class _KanbanCardState extends State<KanbanCard> {
  Color backgroundColor = white;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(secondaryPaddingValue),
    child: GestureDetector(
      child: Draggable<KanbanCardModel>(
        data: widget.card,
        feedback: widget,
        childWhenDragging: _buildDraggingCard(),
        child: MouseRegion(
          onEnter: (enter) {
            setState(() {
              backgroundColor = lightGrey;
            });
          },
          onExit: (exit) {
            setState(() {
              backgroundColor = white;
            });
          },
          child: _buildCardBody()
        ),
      ),
    ),
  );

  Widget _buildCardBody() => Container(
    width: kanbanCardWidth,
    height: kanbanCardHeight,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(borderRadiusValue),
      color: backgroundColor,
      boxShadow: [
        BoxShadow(
          color: darkGrey,
          blurRadius: 2,
          spreadRadius: 0,
          offset: const Offset(
            -0.5,
            1,
          ),
        ), //BoxShadow
      ],
    ),
    child:_buildText(widget.card.title)
  );

  Widget _buildText(String text) => Padding(
    padding: const EdgeInsets.all(primaryPaddingValue),
    child: DefaultTextStyle(   
      style: TextStyle(
        color: darkGrey, 
        fontSize: smallTextFontSize
      ),
      child: Text(text),
    ),
  );

  Widget _buildDraggingCard() => Container(
    width: kanbanCardWidth,
    height: kanbanCardHeight,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(borderRadiusValue),
      color: mediumGrey,
    )
  );
}