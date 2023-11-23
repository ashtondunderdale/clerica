import 'package:flutter/material.dart';
import 'kanban_card.dart';
import 'kanban_column_top.dart';

class KanbanColumn extends StatefulWidget {
  const KanbanColumn({Key? key, required this.columnTitle}) : super(key: key);

  final String columnTitle;

  @override
  _KanbanColumnState createState() => _KanbanColumnState();
}

class _KanbanColumnState extends State<KanbanColumn> {
  List<String> cardTitles = [
    'Card 1',
    'Card 2',
    'Card 3',
  ];

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
                  final String item = cardTitles.removeAt(oldIndex);
                  cardTitles.insert(newIndex, item);
                });
              },
              children: cardTitles
                  .map((title) => ListTile(
                        key: ValueKey(title),
                        title: KanbanCard(cardTitle: title),
                      ))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
