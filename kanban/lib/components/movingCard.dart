import 'package:flutter/material.dart';

class KanbanMovingCard extends StatelessWidget {
  const KanbanMovingCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 250,
      child: Card(
        color: Color.fromARGB(255, 189, 189, 189),
        child: ListTile(
          title: Text("Moving Here", style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),),
        ),
      ),
    );
  }
}