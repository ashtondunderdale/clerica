import 'package:flutter/material.dart';

class KanbanColumnTitle extends StatelessWidget {
  const KanbanColumnTitle({
    Key? key,
    required this.columnTitle,
  }) : super(key: key);

  final String columnTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 50,
        width: 200,
        child: Card(
          shadowColor: Colors.black,
          elevation: 2.0,
          child: ListTile(
            title: Text(
              columnTitle,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              ),
          ),
        ),
      ),
    );
  }
}