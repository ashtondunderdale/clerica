import 'package:flutter/material.dart';
import 'package:kanban_application/models/kanban_card.dart';

class ExpandedCard extends StatelessWidget {
  const ExpandedCard({super.key, required this.card, required this.columnTitle});

  final KanbanCard card;
  final String columnTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onTertiary,
        borderRadius: BorderRadius.only(topLeft:Radius.circular(4), bottomLeft: Radius.circular(4))
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      card.summary.toUpperCase(),
                      style: TextStyle(
                        fontSize: 20,
                        decoration: card.status == "Ready For Release" || card.status == "Ready for Release" ? TextDecoration.lineThrough : TextDecoration.none,                           
                        color: card.status == "Ready For Release" || card.status == "Ready for Release" ? Colors.grey : Theme.of(context).colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text(
                      card.status.toUpperCase(),
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Spacer(),
                  Align(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: Text(
                        card.sprint,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 8, top: 24),
                child: Container(
                  width: 600,
                  height: 360,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      card.comments,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        fontSize: 12
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 12),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "OWNER: ${card.ownedBy == "??" ? "Nobody" : card.ownedBy}",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "ASSIGNEE:  ${card.assignedTo == "??" ? "Nobody" : card.assignedTo}",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        fontSize: 12,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}