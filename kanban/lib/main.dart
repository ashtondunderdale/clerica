import 'package:flutter/material.dart';
import 'widgets/movingCard.dart';
import 'package:kanban_application/widgets/globals.dart';

import 'widgets/column.dart';
import 'widgets/card.dart';

void main() => runApp(KanbanApp());

class KanbanApp extends StatelessWidget {
  const KanbanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kanban Application',
      home: KanbanHome(title: 'Flutter Kanban'),
    );
  }
}

class KanbanHome extends StatefulWidget {
  const KanbanHome({super.key, required this.title});

  final String title;

  @override
  _KanbanHomeState createState() => _KanbanHomeState();
}

class _KanbanHomeState extends State<KanbanHome> {
  DragTarget buildColumn(String columnName) {
    return DragTarget<KanbanCard>(
      builder: (
        context, 
        accepted, 
        rejected,
      ) {
          bool inCurrentColumn = (movingCard == columnName && previousColumn != columnName);
          return Column(
            children: [
              KanbanColumn(columnTitle: columnName,),
              inCurrentColumn ? MovingCard() : Container(),
              Expanded(
                child: Container(
                  width: 200,
                  child: ReorderableListView(
                    scrollDirection: Axis.vertical,
                    onReorder: (int oldIndex, int newIndex) {
                      setState(() {
                        if (oldIndex < newIndex) {
                          newIndex -=1;
                        }
                        final KanbanCard item = kanbanBoard[columnName]!.removeAt(oldIndex);
                        kanbanBoard[columnName]!.insert(newIndex, item);
                      });
                    },
                    children: kanbanBoard[columnName]!.reversed.toList(),
                  ),
                ),
              )
            ],
          );
        },
        onWillAccept: (data) {
          setState(() {
            movingCard = columnName;
          });
          return true;
        },
        onAccept: (KanbanCard data) {
          setState(() {
            var isThere = kanbanBoard[columnName]!
            .firstWhere((element) => element.cardName == data.cardName,
            orElse: () => KanbanCard(
              key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
              cardName: 'NOT FOUND',
            ));
          if (isThere.cardName == 'NOT FOUND') {
            kanbanBoard[columnName]!.add(data);
          }
          if (columnName != previousColumn) {
            kanbanBoard[previousColumn]
                ?.removeWhere((element) => element.cardName == data.cardName);
          }
        });
      },
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            buildColumn('BACKLOG'),
            buildColumn('DEVELOPING'),
            buildColumn('DEVELOPED'),
            buildColumn('TESTING'),
            buildColumn('TESTED'),
            buildColumn('DONE'),
          ],
        ),
      ),
    );
  }
}

