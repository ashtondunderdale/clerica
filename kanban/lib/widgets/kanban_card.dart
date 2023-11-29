import 'package:flutter/material.dart';

class KanbanCard extends StatelessWidget {
  final String cardTitle;
  final bool isTask;
  final bool isBug;
  final bool isIssue;

  KanbanCard({
    required this.cardTitle,
    this.isTask = false,
    this.isBug = false,
    this.isIssue = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: ValueKey(cardTitle),
      title: Text(
        cardTitle,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ashton Dunderdale',
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
              Text(
                'Ashton Dunderdale',
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    if (isTask)
                      Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: Tooltip(
                          message: "task",
                          child: Container(
                            width: 30,
                            height: 10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromARGB(255, 187, 234, 255),
                            ),
                          ),
                        ),
                      ),
                    if (isBug)
                      Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: Tooltip(
                          message: "bug",
                          child: Container(
                            width: 30,
                            height: 10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromARGB(255, 255, 168, 162),
                            ),
                          ),
                        ),
                      ),
                    if (isIssue)
                      Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: Tooltip(
                          message: "issue",
                          child: Container(
                            width: 30,
                            height: 10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromARGB(255, 183, 229, 184)
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
