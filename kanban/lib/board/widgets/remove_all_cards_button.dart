import 'package:flutter/material.dart';
import 'package:kanban_application/board/services/kanban_service.dart';
import 'package:kanban_application/constants.dart';

class RemoveAllCardsButton extends StatelessWidget {
  RemoveAllCardsButton({super.key, required this.onRemovedCards});

  final KanbanService _kanban = KanbanService();
  final VoidCallback onRemovedCards;

  @override
  Widget build(BuildContext context) => Tooltip(
    message: "remove all",
    child: GestureDetector(
      onTap: () {
        _kanban.removeAllCards();
        onRemovedCards();
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Icon(
          Icons.delete_forever,
          color: mediumGrey,
          size: 32,
        ),
      ),
    ),
  );
}