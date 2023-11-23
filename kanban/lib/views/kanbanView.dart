import 'package:flutter/material.dart';

import '../utils/navigation.dart';

class KanbanView extends StatelessWidget {
  const KanbanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          FloatingActionButton(
            onPressed: () => navigateToPage(context, 'homeView'),
          ),
        ],
      )
    );
  }
}