import 'package:flutter/material.dart';
import 'package:kanban_application/utils/name_service.dart';
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
    double colourBorderWidth = 2.5;

    NameService nameService = NameService();

    return DragTarget<KanbanCard>(
      onWillAccept: (droppedCard) => true,
      onAccept: (droppedCard) => widget.onCardDropped(widget.title, droppedCard),
      builder: (context, candidateData, rejectedData) {
        Color dropLocationColor =
            candidateData.isEmpty ? Theme.of(context).colorScheme.background : Theme.of(context).colorScheme.background;
        return Container(
          width: columnWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: dropLocationColor,
          ),
          child: ReorderableListView(
            onReorder: (int oldIndex, int newIndex) {
              if (oldIndex < newIndex) newIndex -= 1;
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
                        content: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: card.summary.contains("Case") ? Color.fromARGB(255, 255, 166, 160) : Color.fromARGB(255, 200, 149, 255),
                                width: 8
                              )
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          width: 900,
                          height: 500,
                          child: ExpandedCard(card: card, columnTitle: widget.title),
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
                        color: Theme.of(context).colorScheme.onTertiaryContainer,
                        borderRadius: BorderRadius.circular(2),
                        border: Border(
                            left: BorderSide(
                              color: card.summary.contains("Case") ? Color.fromARGB(255, 255, 166, 160) : Color.fromARGB(255, 200, 149, 255), // change this logic to actually work for a bug
                              width: colourBorderWidth,
                            )
                          ),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        card.summary.toUpperCase(),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 12,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.normal
                        ),
                      ),
                    ),
                    childWhenDragging: Center(
                      child: Container(
                        width: columnWidth - 10,
                        height: cardHeight,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onTertiaryContainer.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(2),
                          border: Border(
                            left: BorderSide(
                              color: card.summary.contains("Case") ? Color.fromARGB(255, 255, 166, 160).withOpacity(0.5) : Color.fromARGB(255, 200, 149, 255).withOpacity(0.5), // change this logic to actually work for a bug
                              width: colourBorderWidth,
                            ),
                          ),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          card.summary.toUpperCase(),
                          style: const TextStyle(
                            color: Color.fromARGB(255, 230, 230, 230),
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    child: Center(
                      child: Container(
                        width: columnWidth - 10,
                        height: cardHeight,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onTertiaryContainer,
                          borderRadius: BorderRadius.circular(2),
                          border: Border(
                            left: BorderSide(
                              color: card.summary.contains("Case") ? Color.fromARGB(255, 255, 166, 160) : Color.fromARGB(255, 200, 149, 255), // change this logic to actually work for a bug
                              width: colourBorderWidth,
                            )
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.15),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: Text(
                                card.project.toUpperCase(),
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.onPrimary,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              card.summary,
                              style: TextStyle(
                                fontSize: 12,
                                color: widget.title == "DONE" ? Theme.of(context).colorScheme.onPrimary.withOpacity(0.5) : Theme.of(context).colorScheme.onSurfaceVariant,
                                decoration: widget.title == "DONE" ? TextDecoration.lineThrough : TextDecoration.none
                              ),
                            ),
                            Spacer(),
                            Row(
                              children: [
                                Text(
                                  nameService.getInitials(card.ownedBy),
                                  style: TextStyle(
                                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                                    fontSize: 14
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8, right: 8),
                                  child: Icon(
                                    Icons.arrow_forward_outlined,
                                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                                    size: 12,
                                  ),
                                ),
                                Text(
                                  nameService.getInitials(card.assignedTo),
                                  style: TextStyle(
                                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                                    fontSize: 14
                                  ),
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(right: 4, bottom: 4),
                                  child: Text(
                                    card.storyPoints.toString(),
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
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