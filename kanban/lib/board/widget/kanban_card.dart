import 'package:flutter/material.dart';

import '../../constants.dart';
import '../models/kanban_card_model.dart';


class KanbanCard extends StatelessWidget {
  const KanbanCard({Key? key, required this.card});

  final KanbanCardModel card;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(secondaryPaddingValue),
    child: GestureDetector(
      child: Draggable<KanbanCardModel>(
        data: card,
        feedback: this,
        child: Container(
          width: kanbanCardWidth,
          height: kanbanCardHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadiusValue),
            color: white,
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
          child:_buildText(card.title)
        ),
      ),
    ),
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
}