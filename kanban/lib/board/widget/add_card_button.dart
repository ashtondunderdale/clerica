import 'package:flutter/material.dart';
import 'package:kanban_application/constants.dart';

class AddCardButton extends StatefulWidget {
  const AddCardButton({super.key});

  @override
  State<AddCardButton> createState() => _AddCardButtonState();
}

class _AddCardButtonState extends State<AddCardButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: _isHovered ? SystemMouseCursors.click : MouseCursor.defer,      
      onEnter: (_) {
        setState(() => _isHovered = true);
      },
      onExit: (_) {
        setState(() => _isHovered = false);
      },
      child: Container(
        width: kanbanCardWidth,
        height: 40,
        decoration: BoxDecoration(
          color: _isHovered ? mediumGrey : lightGrey,
          borderRadius: BorderRadiusDirectional.circular(borderRadiusValue)
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(primaryPaddingValue),
              child: Icon(
                Icons.add,
                color: veryDarkGrey,
                size: 16,
              ),
            ),
            Text(
              "add new card",
              style: TextStyle(
                color: veryDarkGrey, 
                fontSize: smallTextFontSize
              ),
            ),
          ],
        ),
      ),
    );
  }
}