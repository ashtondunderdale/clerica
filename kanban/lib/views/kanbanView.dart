import 'package:flutter/material.dart';

import 'back_button.dart';


class KanbanView extends StatelessWidget {
  const KanbanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          LogoutButton()
        ],
      )
    );
  }
}