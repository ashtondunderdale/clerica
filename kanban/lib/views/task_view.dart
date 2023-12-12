import 'package:flutter/material.dart';

import '../utils/data.dart';

class TaskView extends StatelessWidget {
  const TaskView({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onSecondary,
        automaticallyImplyLeading: false,
        title: Text(
          "Task View",
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontWeight: FontWeight.bold,                       
          ),
        ),
        leading: Tooltip(
          message: "Back",
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
      body: Center(
        child: Container(
          width:MediaQuery.of(context).size.width - 200,
          height: MediaQuery.of(context).size.height - 200,
          color: Theme.of(context).colorScheme.onTertiary,
          child: ListView.builder(
            itemCount: kanbanData.fold<int>(0, (prev, element) => prev + element.cards.length),
            itemBuilder: (context, index) {
              int currentCardIndex = index;
              for (var columnData in kanbanData) {
                if (currentCardIndex < columnData.cards.length) {
                  final kanbanCard = columnData.cards[currentCardIndex];
                  return Padding(
                    padding: const EdgeInsets.only(left: 2, top: 2, right: 2),
                    child: Container(
                      color: Theme.of(context).colorScheme.onSecondary,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 140,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                columnData.title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.onPrimary                            
                                ),
                              ),
                            ),   
                          ),
                          Text(
                            kanbanCard.summary,
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text(
                              kanbanCard.summary == "this is a bug" ? "BUG" : "TASK",
                              style: TextStyle(
                                color: kanbanCard.summary == "this is a bug" ? const Color.fromARGB(255, 255, 175, 175) : Color.fromARGB(255, 198, 223, 255),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  );
                } else {
                  currentCardIndex -= columnData.cards.length;
                }
              }
              return SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
