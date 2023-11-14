import 'package:flutter/material.dart';
import 'package:kanban_application/widgets/globals.dart';

class KanbanCard extends StatelessWidget {
  const KanbanCard({super.key, required this.cardName});

  final String cardName;

  @override
  Widget build(BuildContext context) {
    return Draggable<KanbanCard>(
      data: KanbanCard(
        cardName: cardName,
      ),

      child: SizedBox(
        height: 50,
        width: 200,
        child: Card(
          child: ListTile(
            title: Text(cardName),
          ),
        ),
      ),

      feedback: SizedBox(
        height: 50,
        width: 200,
        child: Card(
          color: Colors.grey,
          child: ListTile(
            title: Text(cardName, style: TextStyle(color: Colors.white),)
          ),
        ),
      ),

      childWhenDragging: SizedBox(
        height: 50,
        width: 200,
        child: Card(
          color: Colors.grey,
          child: ListTile(
            title: Text(
              cardName, 
              style: TextStyle(
                color: Colors.white
              ),
            ),
          ),
        ),
      ),
      onDragStarted: () {
        kanbanBoard.forEach((key, value) {
          var contains = value.firstWhere((element) => element.cardName == cardName,
          orElse: () => KanbanCard(
            key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
            cardName: 'NOT FOUND',
          ));
        if (contains.cardName != 'NOT FOUND') previousColumn = key;
      });
      },
      onDragCompleted: () {
        movingCard = "";
      },
    );
  }
}
