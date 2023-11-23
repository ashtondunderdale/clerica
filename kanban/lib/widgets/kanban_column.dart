import 'package:flutter/material.dart';

class KanbanColumn extends StatelessWidget {
  const KanbanColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
      child: Container(
        height: 650,
        width: 240,
        color: Colors.black,
      ),
    );
  }
}