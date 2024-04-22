import 'package:flutter/material.dart';

import '../../constants.dart';

class KanbanButton extends StatelessWidget {
  const KanbanButton({super.key, required this.icon, required this.onPressed, required this.message, required this.buttonStateFlag});

  final bool buttonStateFlag;
  final IconData icon;
  final String message;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => Tooltip(
    message: message == "" ? null : message,
    child: GestureDetector(
      onTap: () {
        onPressed();
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Icon(
          icon,
          color: buttonStateFlag ? veryDarkGrey : mediumGrey,
          size: 32,
        ),
      ),
    ),
  );
}