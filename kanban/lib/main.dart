import 'package:flutter/material.dart';
import 'widgets/movingCard.dart';

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
  State<KanbanHome> createState() => _KanbanHomeState();
}

class _KanbanHomeState extends State<KanbanHome> {
  String previousColumn = "";
  String movingCard = "";

  DragTarget buildColumn(String columnName) {
    return DragTarget<KanbanCard>
    (
      builder: (
        BuildContext context, 
        List<KanbanCard?> candidateData, 
        List<dynamic> rejectedData,
      ) {
          bool inCurrentColumn = (movingCard == columnName && previousColumn != columnName);
          return Column(
            children: [
              KanbanColumn(columnTitle: columnName,),
              inCurrentColumn ? MovingCard() : Container(),
            ],
          );
        },
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8),
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

