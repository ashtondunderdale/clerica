import 'package:flutter/material.dart';
import '../utils/kanban_card_data.dart';

class CardDragTarget extends StatelessWidget {
  final Function(KanbanCardData) onDragItemAccepted;
  final List<KanbanCardData> targetList;

  CardDragTarget({
    Key? key,
    required this.onDragItemAccepted,
    required this.targetList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DragTarget(
      onWillAccept: (data) {
        return true;
      },
      onAccept: (data) {
        onDragItemAccepted(data as KanbanCardData);
      },
      builder: (BuildContext context, List<dynamic> candidateData, List<dynamic> rejectedData) {
        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
            width: 190,
            height: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: candidateData.isNotEmpty
                  ? Color.fromARGB(255, 194, 224, 255)
                  : Color.fromARGB(255, 244, 244, 244),
            ),
          ),
        );
      },
    );
  }
}

