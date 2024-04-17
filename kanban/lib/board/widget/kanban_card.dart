import 'package:flutter/material.dart';

import '../../constants.dart';
import '../models/kanban_card_model.dart';


class KanbanCard extends StatelessWidget {
  const KanbanCard({super.key, required this.card});

  final KanbanCardModel card;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(secondaryPaddingValue),
    child: Container(
      width: kanbanCardWidth,
      height: kanbanCardHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadiusValue),
        color: mediumGrey
      ),
    ),
  );
}
