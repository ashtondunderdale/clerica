import 'package:flutter/material.dart';

import 'components/card.dart';
import 'components/column.dart';
import 'components/movingCard.dart';
import 'components/globals.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kanban Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Kanban Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DragTarget createDragColumn(String columnName) {
    return DragTarget<KanbanCard>(
      builder: (
          context,
          accepted,
          rejected,
          ) {
        bool isInCurrentColumn = (movingCard == columnName && previousColumn != columnName);
        return Column(
          children: [
            KanbanColumnTitle(columnTitle: columnName),
            isInCurrentColumn ? KanbanMovingCard() : Container(),
            Expanded(
              child: Container(
                width: 250,
                child: ReorderableListView(
                  scrollDirection: Axis.vertical,
                  onReorder: (int oldIndex, int newIndex) {
                    setState(() {
                      if (oldIndex < newIndex) {
                        newIndex -= 1;
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
            createDragColumn("BACKLOG"),
            createDragColumn("DEVELOPING"),
            createDragColumn("DEVELOPED"),
            createDragColumn("TESTING"),
            createDragColumn("TESTED"),
            createDragColumn("DONE"),
          ],
        ),
      ),
    );
  }
}