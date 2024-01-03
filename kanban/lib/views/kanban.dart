import 'package:flutter/material.dart';
import 'package:kanban_application/utils/api_service.dart';
import 'package:kanban_application/widgets/appbar/dark_mode_button.dart';
import 'package:kanban_application/widgets/appbar/dropdown.dart';
import '../models/data.dart';
import '../models/kanban_card.dart';
import '../widgets/kanban/kanban_column.dart';
import '../widgets/kanban/kanban_column_title.dart';
import '../widgets/appbar/sprint_label.dart';
import '../widgets/appbar/task_view_button.dart';
import '../widgets/appbar/user_list.dart';

class KanbanView extends StatefulWidget {
  KanbanView({Key? key}) : super(key: key);

  @override
  _KanbanViewState createState() => _KanbanViewState();
}

class _KanbanViewState extends State<KanbanView> {
  late Map<String, List<KanbanCard>> columnCards;

  @override
  void initState() {
    super.initState();

    columnCards = {
      for (var title in columnTitles) title: kanbanData.firstWhere((data) => data.title == title).cards
    };
 
    api.clearKanban();

    api.getPhases("Specific User Project Phases", users[loggedInUser].toString()); // should get for currently logged in user
    api.addListener(() {
      setState(() {});
    });
  }

  void onCardDropped(String oldColumnTitle, String newColumnTitle, KanbanCard droppedCard) {
    setState(() {
      columnCards[oldColumnTitle]!.remove(droppedCard);
      columnCards[newColumnTitle]!.add(droppedCard);
    });
  }

  ApiService api = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent, 
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 6.6 / 5 - 5),
          child: Text(
            "Development View",
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        toolbarHeight: 100,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      TaskViewButton(),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, bottom: 10),
                        child: DarkModeButton()
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10, left: 16),
                        child: Tooltip(
                          message: "Logout",
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                              loggedInUser = "";
                            },
                            icon: Icon(Icons.arrow_back),
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  PhasesDropDownButton(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end, 
                    children: [
                      SprintLabel(),
                      UserList(),
                    ],
                  ),
                ],
              ),
              Container(
                color: Theme.of(context).colorScheme.onTertiary,
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
              padding: const EdgeInsets.only(top: 12, left: 10, right: 0),
              child: Column(
                children: [
                  KanbanColumnTop(title: title, cardAmount: columnCards[title]?.length ?? 0),
                  Expanded(
                    child: KanbanColumn(
                      title: title,
                      cardList: columnCards[title] ?? [],
                      onCardDropped: (String newColumnTitle, KanbanCard droppedCard) {
                        String currentColumnTitle = columnCards.entries
                            .firstWhere((entry) => entry.value.contains(droppedCard), orElse: () => const MapEntry("", [])).key;
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