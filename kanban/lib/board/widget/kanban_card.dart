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
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(secondaryPaddingValue),
    child: GestureDetector(
      child: Draggable<KanbanCardModel>(
        data: widget.card,
        feedback: widget,
        childWhenDragging: _buildDraggingCard(),
        child: MouseRegion(
        onEnter: (_) {
          setState(() => _isHovered = true);
        },
        onExit: (_) {
          setState(() => _isHovered = false);
        },
          child: _buildCardBody()
        ),
      ),
    ),
  );

  Widget _buildCardBody() => AnimatedContainer(
    duration: _isHovered ? Duration(milliseconds: 200) : Duration(milliseconds: 100),
    width: kanbanCardWidth,
    height: kanbanCardHeight,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(borderRadiusValue),
      color: _isHovered ? lightGrey : backgroundColor,
      boxShadow: [
        BoxShadow(
          color: darkGrey,
          blurRadius: 2,
          spreadRadius: 0,
          offset: const Offset(-0.5, 1),
        ),
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