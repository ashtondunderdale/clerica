import 'package:flutter/material.dart';
import 'globals.dart';

class KanbanMovingCard extends StatelessWidget {
  const KanbanMovingCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: cardHeight,
      width: MediaQuery.of(context).size.width * 0.15,
      child: Card(
        color: Color.fromARGB(255, 236, 236, 236),
        child: ListTile(
          title: Text("Moving Here", style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),),
        ),
      ),
    );
  }
}