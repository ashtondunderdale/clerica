import 'package:flutter/material.dart';
import 'package:testkanban/widgets/kanban_card.dart';

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
        return Row(
            children: [
              for (var card in widget.cardList)
                Padding(
                  padding: const EdgeInsets.only(bottom: 4, top: 4),
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
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 101, 101, 101),
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
