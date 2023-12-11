import 'package:flutter/material.dart';
import '../utils/data.dart';
import '../widgets/kanban_card.dart';
import '../widgets/kanban_column.dart';
import '../widgets/kanban_column_top.dart';
import '../widgets/user_list.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late Map<String, List<KanbanCard>> columnCards;

  @override
  void initState() {
    super.initState();
    columnCards = { 
      for (var title in columnTitles) 
        title : kanbanData.firstWhere((data) => data.title == title).cards 
      };
  }

  void onCardDropped(String oldColumnTitle, String newColumnTitle, KanbanCard droppedCard) {
    setState(() {
      columnCards[oldColumnTitle]!.remove(droppedCard);
      columnCards[newColumnTitle]!.add(droppedCard);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        toolbarHeight: 100,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 24, bottom: 4),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 2, bottom: 2, left: 8, right: 8),
                        child: Text(
                          'SPRINT 17',
                          style: TextStyle(
                            color: const Color.fromARGB(255, 77, 77, 77),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  UserList(),
                ],
              ),
              Container(
              color: const Color.fromARGB(255, 220, 220, 220),
              height: 2.0,
              )
            ],
          ),
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (var title in columnTitles)
            Padding(
              padding: const EdgeInsets.only(top: 12, left: 10, right: 10),
              child: Column(
                children: [
                  KanbanColumnTop(title: title),
                  Expanded(
                    child: KanbanColumn(
                      title: title,
                      cardList: columnCards[title] ?? [],
                      onCardDropped: (String newColumnTitle, KanbanCard droppedCard) {
                        String currentColumnTitle = columnCards.entries
                            .firstWhere((entry) => entry.value
                            .contains(droppedCard), orElse: () => const MapEntry("", [])).key;
                        onCardDropped(currentColumnTitle, newColumnTitle, droppedCard);
                      },
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
