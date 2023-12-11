import 'package:flutter/material.dart';
import 'package:kanban_application/widgets/expanded_card.dart';

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
    double cardHeight = 100;

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
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context){
                      return AlertDialog(
                        contentPadding: EdgeInsets.all(0),
                        content: SizedBox(
                          width: 500,
                          height: 600,
                          child: ExpandedCard(summary: card.summary, columnTitle: widget.title),
                        ),
                      );
                    }
                  );
                },
                key: ValueKey(card),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 4, top: 4),
                  child: Draggable<KanbanCard>(
                    data: card,
                    feedback: Container(
                      width: columnWidth,
                      height: cardHeight,
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
                          fontWeight: FontWeight.normal
                        ),
                      ),
                    ),
                    childWhenDragging: Container(
                      width: columnWidth,
                      height: cardHeight,
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
                        height: cardHeight,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(2),
                          border: Border(
                            left: BorderSide(
                              color: card.summary == "this is a bug" ? Color.fromARGB(255, 255, 166, 160) : Color.fromARGB(255, 149, 216, 255), // change this logic to actually work for a bug
                              width: 2
                            )
                          ),
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
                            color: widget.title == "DONE" ? Colors.grey : const Color.fromARGB(255, 68, 68, 68),
                            decoration: widget.title == "DONE" ? TextDecoration.lineThrough : TextDecoration.none
                          ),
                        ),
                      ),
                    ),
                  ),           // admin_panel_settings_outlined, assignment_ind_outlined, bug_report_outlined, content_paste_go, person_add_alt, supervised_user_circle_outlined
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