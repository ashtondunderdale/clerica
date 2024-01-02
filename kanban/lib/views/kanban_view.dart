import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kanban_application/widgets/dark_mode_button.dart';
import '../utils/data.dart';
import '../widgets/kanban_card.dart';
import '../widgets/kanban_column.dart';
import '../widgets/kanban_column_top.dart';
import '../widgets/sprint_label.dart';
import '../widgets/task_view_button.dart';
import '../widgets/user_list.dart';

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
    _getPhases();
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
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent, 
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 6.6 / 5 - 5),
          child: Text(
            "Kanban Board",
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

  Future<bool> _getPhases() async {

    const String apiUrl = 'https://localhost:7190/api/v1/ProjectManagementSvc/Epicor/BaqSvcGetProjectPhases';

    Map<String, String> header = {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };

    try {
      http.Response response = await http.post(Uri.parse(apiUrl), headers: header);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final parsedData = jsonDecode(json);
        
        List<dynamic> projects = parsedData['value'];

        for (var project in projects) {
          KanbanCard card = KanbanCard(
            summary:  project['ProjPhase_Description']  ?? "Null",
            status:   project['UD04Status_Character01'] ?? 'Ignored',
            comments: project['ProjPhase_Comments_c']   ?? "Null",
            sprint:   project['UD02_Character01']       ?? "Null",
            project:  project['Project_Description']    ?? "Null",

          );
          
          switch (card.status)
          {
            case "Backlog":
              setState(() {
                kanbanData[0].cards.add(card);                     
              });

            case "In Development":
              setState(() {
                kanbanData[1].cards.add(card);                     
              });

            case "Developed":
              setState(() {
                kanbanData[2].cards.add(card);                     
              });

            case "In Test":
              setState(() {
                kanbanData[3].cards.add(card);                     
              });

            case "Tested":
              setState(() {
                kanbanData[4].cards.add(card);                     
              });

            case "Done":
              setState(() {
                kanbanData[5].cards.add(card);                     
              });

            default:
              print("Null Status for card: ${card.summary}");
          }
        }
        return true;
      } 
      else 
      {
        print('Error: ${response.statusCode}');
        return false;
      }
    } 
    catch (e) 
    {
      print("Exception Error: $e");
      return false;
    }
  }
}