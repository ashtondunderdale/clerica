import 'package:flutter/material.dart';
import 'package:kanban_application/widgets/kanban_card.dart';

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
                  Text(
                    card.summary.toUpperCase(),
                    style: TextStyle(
                      fontSize: 20,
                      decoration: columnTitle == "DONE" ? TextDecoration.lineThrough : TextDecoration.none,
                      color: columnTitle == "DONE" ? Colors.grey : Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text(
                      columnTitle,
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
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
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
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Text(
              "Assigned To: ${card.assignedTo}",
            ),
            Text(
              "Owned By: ${card.ownedBy}",
            )
          ],
        ),
      ),
    );
  }
}