import 'package:flutter/material.dart';
import 'package:kanban_application/board/services/kanban_service.dart';

import '../../constants.dart';
import '../models/kanban_card_model.dart';


class KanbanCard extends StatefulWidget {
  const KanbanCard({Key? key, required this.card, required this.onCardRemoved});

  final KanbanCardModel card;
  final VoidCallback onCardRemoved;

  @override
  State<KanbanCard> createState() => _KanbanCardState();
}

class _KanbanCardState extends State<KanbanCard> {
  KanbanService _kanban = KanbanService();

  Color _backgroundColor = white;
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
      color: _isHovered ? lightGrey : _backgroundColor,
      boxShadow: [
        BoxShadow(
          color: darkGrey,
          blurRadius: 2,
          spreadRadius: 0,
          offset: const Offset(-0.5, 1),
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.all(primaryPaddingValue),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: kanbanCardWidth - 40,
                child: _buildText(widget.card.title)),
              Spacer(),
              _isHovered ? _buildBinIcon() : SizedBox(),
            ],
          ),
          Spacer(),
          _isHovered ? _buildText(widget.card.id) : SizedBox()
        ],
      ),
    ),
  );

  Widget _buildBinIcon() => MouseRegion(
    cursor: SystemMouseCursors.click,
    child: GestureDetector(
      onTap: () {
        _kanban.removeCard(widget.card);
        widget.onCardRemoved();
      },
      child: Icon(
        Icons.delete,
        color: darkGrey,
        size: 16,
      ),
    ),
  );

  Widget _buildText(String text) => DefaultTextStyle(   
    style: TextStyle(
      color: darkGrey, 
      fontSize: smallTextFontSize
    ),
    child: Text(text),
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