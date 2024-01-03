import 'package:flutter/material.dart';

import '../utils/data.dart';

class TaskView extends StatelessWidget {
  const TaskView({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
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
          width:MediaQuery.of(context).size.width - 100,
          height: MediaQuery.of(context).size.height - 200,
          color: Theme.of(context).colorScheme.onTertiary,
          child: ListView.builder(
            itemCount: kanbanData.fold<int>(0, (prev, element) => prev + element.cards.length),
            itemBuilder: (context, index) {
              int currentCardIndex = index;
              for (var columnData in kanbanData) {
                if (currentCardIndex < columnData.cards.length) {
                  final card = columnData.cards[currentCardIndex];
                  return Padding(
                    padding: const EdgeInsets.only(left: 2, top: 2, right: 2),
                    child: Container(
                      color: Theme.of(context).colorScheme.background,
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
                            card.summary,
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text(
                              card.summary.contains("Case") ? "CASE" : "TASK",
                              style: TextStyle(
                                color: card.summary.contains("Case") ? const Color.fromARGB(255, 255, 175, 175) : Color.fromARGB(255, 200, 149, 255),
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
