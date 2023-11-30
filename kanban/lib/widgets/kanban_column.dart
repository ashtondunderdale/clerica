import 'package:flutter/material.dart';
import 'package:kanban_application/utils/kanban_card_data.dart';
import 'drag_target.dart';
import 'kanban_card.dart';
import 'kanban_column_top.dart';

class KanbanColumn extends StatefulWidget {
  const KanbanColumn({
    Key? key,
    required this.columnTitle,
    required this.columnCardList,
    this.hideBugs = false,
  }) : super(key: key);

  final String columnTitle;
  final List<KanbanCardData> columnCardList;
  final bool hideBugs;

  @override
  _KanbanColumnState createState() => _KanbanColumnState();
}

class _KanbanColumnState extends State<KanbanColumn> {
  void onDragItemAccepted(KanbanCardData draggedItem) {
    setState(() {
      allCards.removeWhere((item) => item.title == draggedItem.title);
      draggedItem.columnTitle = widget.columnTitle;
      allCards.add(draggedItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double columnWidth = screenWidth / 8;

    double screenHeight = MediaQuery.of(context).size.height;
    double columnHeight = screenHeight / 1.25;

    return Column(
      key: ValueKey<String>('column_${widget.columnTitle}'),
      children: [
        KanbanColumnTop(title: widget.columnTitle),
        CardDragTarget(
          onDragItemAccepted: (data) {
            onDragItemAccepted(data as KanbanCardData);
          },
          targetList: widget.columnCardList,
        ),
        Padding(
          key: ValueKey<String>('padding_${widget.columnTitle}'),
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Container(
            height: columnHeight,
            width: columnWidth,
            key: ValueKey<String>('container_${widget.columnTitle}'),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              color: Color.fromARGB(255, 245, 245, 245),
            ),
            child: ReorderableListView(
              onReorder: (int oldIndex, int newIndex) {
                setState(() {
                  if (oldIndex < newIndex) {
                    newIndex -= 1;
                  }
                  final KanbanCardData item = widget.columnCardList.removeAt(oldIndex);
                  widget.columnCardList.insert(newIndex, item);
                });
              },
              children: widget.columnCardList
                  .map(
                    (cardData) => ListTile(
                      key: ValueKey(cardData.title),
                      title: Draggable(
                        data: cardData,
                        feedback: Material(
                          child: SizedBox(
                            width: 170,
                            height: 140,
                            child: KanbanCard(
                              cardTitle: cardData.title,
                              isTask: cardData.isTask,
                              isBug: cardData.isBug,
                              isIssue: cardData.isIssue,
                            ),
                          ),
                        ),
                        childWhenDragging: KanbanCard(
                          cardTitle: cardData.title,
                          isTask: cardData.isTask,
                          isBug: cardData.isBug,
                          isIssue: cardData.isIssue,
                        ),
                        child: KanbanCard(
                          cardTitle: cardData.title,
                          isTask: cardData.isTask,
                          isBug: cardData.isBug,
                          isIssue: cardData.isIssue,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
