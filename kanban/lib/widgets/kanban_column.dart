import 'package:flutter/material.dart';

import 'kanban_card.dart';

class KanbanColumn extends StatefulWidget {
  final String title;
  final List<KanbanCard> cardList;
  final Function(String, KanbanCard) onCardDropped;

  const KanbanColumn({Key? key, required this.title, required this.cardList, required this.onCardDropped})
      : super(key: key);

  @override
  State<KanbanColumn> createState() => _KanbanColumnState();
}

class _KanbanColumnState extends State<KanbanColumn> {
  @override
  Widget build(BuildContext context) {
    double columnWidth = MediaQuery.of(context).size.width / 6.6;

    return DragTarget<KanbanCard>(
      onWillAccept: (droppedCard) => true,
      onAccept: (droppedCard) => widget.onCardDropped(widget.title, droppedCard),
      builder: (context, candidateData, rejectedData) {
        Color dropLocationColor =
            candidateData.isEmpty ? const Color.fromARGB(255, 255, 255, 255) : const Color.fromARGB(255, 246, 246, 246);
        return Container(
          width: columnWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: dropLocationColor,
          ),
          child: ReorderableListView(
            onReorder: (int oldIndex, int newIndex) {
              if (oldIndex < newIndex) {
                newIndex -= 1;
              }
              onReorder(oldIndex, newIndex);
            },
            children: [
              for (var card in widget.cardList)
                Padding(
                  key: ValueKey(card),
                  padding: const EdgeInsets.only(bottom: 4, top: 4),
                  child: Draggable<KanbanCard>(
                    data: card,
                    feedback: Container(
                      width: columnWidth,
                      height: 100,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 243, 243, 243),
                        borderRadius: BorderRadius.circular(2),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        card.summary.toUpperCase(),
                        style: const TextStyle(
                            color: Color.fromARGB(255, 101, 101, 101),
                            fontSize: 12,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    childWhenDragging: Container(
                      width: columnWidth,
                      height: 100,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 230, 230, 230),
                        borderRadius: BorderRadius.circular(2),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        card.summary,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 230, 230, 230),
                          fontSize: 12,
                        ),
                      ),
                    ),
                    child: Center(
                      child: Container(
                        width: columnWidth - 10,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(2),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          card.summary.toUpperCase(),
                          style: TextStyle(
                            fontSize: 12,
                            color: Color.fromARGB(255, 59, 59, 59),
                            decoration: widget.title == "DONE" ? TextDecoration.lineThrough : TextDecoration.none
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  void onReorder(int oldIndex, int newIndex) {

    setState(() {
      final KanbanCard movedCard = widget.cardList.removeAt(oldIndex);
      widget.cardList.insert(newIndex, movedCard);
    });
  }
}