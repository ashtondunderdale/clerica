import 'package:flutter/material.dart';

class KanbanCard extends StatelessWidget {
  final String cardTitle;

  KanbanCard({required this.cardTitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(cardTitle),
      ),
    );
  }
}
