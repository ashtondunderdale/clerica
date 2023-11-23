import 'package:flutter/material.dart';

import '../utils/navigation.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          FloatingActionButton(
            onPressed: () => navigateToPage(context, 'kanbanView'),
          )
        ],
      ),
    );
  }
}