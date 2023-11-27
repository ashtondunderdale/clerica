import 'package:flutter/material.dart';

class KanbanCard extends StatelessWidget {
  final String cardTitle;

  KanbanCard({
    required this.cardTitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: ValueKey(cardTitle),
      title: Text(
        cardTitle,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 13
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
                    Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: Container(
                        width: 30,
                        height: 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 187, 234, 255),
                        ),
                      ),
                    ),
                    Padding( // red for if the card is a bug
                      padding: const EdgeInsets.only(right: 4),
                      child: Container(
                        width: 30,
                        height: 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 255, 168, 162),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
