import 'package:flutter/material.dart';

class KanbanColumnTop extends StatelessWidget {
  const KanbanColumnTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 90),
      child: Container(
        color: Colors.grey,
        width: 240,
        height: 50,
      ),
    );
  }
}