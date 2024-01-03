import 'package:flutter/material.dart';

import '../../views/tasks.dart';

class TaskViewButton extends StatelessWidget {
  const TaskViewButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 6.6 / 5 + 10, bottom: 12),
      child: Tooltip(
        message: "Task View",
        child: FloatingActionButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => TaskView())),
          mini: true,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          backgroundColor: Theme.of(context).colorScheme.onSecondary,
          child: Icon(Icons.format_list_bulleted),
        ),
      ),
    );
  }
}