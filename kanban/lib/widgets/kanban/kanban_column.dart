import 'package:flutter/material.dart';
import 'package:kanban_application/utils/api_service.dart';
import 'package:kanban_application/utils/name_service.dart';
import 'package:kanban_application/widgets/kanban/kanban_card.dart';
import 'package:kanban_application/widgets/kanban/expanded_card.dart';

import '../../models/kanban_card.dart';

class KanbanColumn extends StatefulWidget {
  final String title;
  final List<KanbanCard> cardList;
  final Function(String, KanbanCard) onCardDropped;

  const KanbanColumn({Key? key, required this.title, required this.cardList, required this.onCardDropped}): super(key: key);

  @override
  State<KanbanColumn> createState() => _KanbanColumnState();
}

class _KanbanColumnState extends State<KanbanColumn> {
  @override
  Widget build(BuildContext context) {
    
    double columnWidth = MediaQuery.of(context).size.width / 6.6;
    ApiService api = ApiService();

    return DragTarget<KanbanCard>(
      onWillAccept: (droppedCard) => true,
      onAccept: (droppedCard){
        widget.onCardDropped(widget.title, droppedCard);
        api.updateEpicorPhaseStatus(widget.title, droppedCard);
      },
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
              for (int index = 0; index < widget.cardList.length; index++)
                NewKanbanCard(
                  columnWidth: MediaQuery.of(context).size.width / 6.6,
                  key: ValueKey(widget.cardList[index]),
                  card: widget.cardList[index],             
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