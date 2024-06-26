import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kanban_application/board/data.dart';
import 'package:kanban_application/board/models/kanban_column_model.dart';
import 'package:kanban_application/board/services/kanban_service.dart';
import 'package:kanban_application/constants.dart';
import 'dart:math';

class AddCardButton extends StatefulWidget {
  const AddCardButton({super.key, required this.column, required this.onCardAdded});

  final KanbanColumnModel column;
  final VoidCallback onCardAdded;

  @override
  State<AddCardButton> createState() => _AddCardButtonState();
}

class _AddCardButtonState extends State<AddCardButton> {
  KanbanService _kanban = KanbanService();

  final TextEditingController _cardTitleController = TextEditingController();
  bool _isHovered = false;
  bool _isClicked = false;
  String _addCardMessage = addCardMessages[0];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isClicked = true;
          _addCardMessage = addCardMessages.elementAt(Random().nextInt(addCardMessages.length));
        });
      },
      child: MouseRegion(
        cursor: _isHovered ? SystemMouseCursors.click : MouseCursor.defer,      
        onEnter: (_) {
          setState(() => _isHovered = true);
        },
        onExit: (_) {
          setState(() => _isHovered = false);
        },
        child: _isClicked ? _buildAddCardContainer(_cardTitleController) : _buildAddCardOption()
      ),
    );
  }

  Widget _buildAddCardOption() => Padding(
    padding: const EdgeInsets.only(top: primaryPaddingValue),
    child: Container(
      width: kanbanCardWidth - 4,
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
          Text("add new card",
            style: TextStyle(
              color: veryDarkGrey, 
              fontSize: smallTextFontSize,
            ),
          ),
        ],
      ),
    ),
  );


  Widget _buildAddCardContainer(TextEditingController controller) => KeyboardListener(
    focusNode: FocusNode(),
    onKeyEvent: (KeyEvent event) {
      if (event.logicalKey == LogicalKeyboardKey.enter) {
        _kanban.addCard(controller.text, widget.column.title);      
        widget.onCardAdded();

        setState(() {
          _isClicked = false;
          controller.clear();
        });
      }
    },
    child: Container(
      width: kanbanCardWidth - 4,
      height: kanbanCardHeight,
      decoration: BoxDecoration(
        color: white,
        border: Border.all(color: mediumGrey, width: 2),
        borderRadius: BorderRadiusDirectional.circular(borderRadiusValue)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: kanbanCardWidth - 40,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: primaryPaddingValue),
              child: TextField(
                maxLength: maxTaskChars,
                cursorColor: darkGrey,
                style:  TextStyle(
                  color: darkGrey, 
                  fontSize: smallTextFontSize
                ),
                controller: controller,
                decoration: InputDecoration(
                hintText: _addCardMessage,
                  border: InputBorder.none,
                ),
                autofocus: true,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}