import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kanban_application/board/services/kanban_service.dart';

import '../../constants.dart';

class AddColumnButton extends StatefulWidget {
  const AddColumnButton({super.key, required this.onColumnAdded});

  final VoidCallback onColumnAdded;

  @override
  State<AddColumnButton> createState() => _AddColumnButtonState();
}

class _AddColumnButtonState extends State<AddColumnButton> {
  final _kanban = KanbanService();
  final _controller = TextEditingController();

  bool _isClicked = false;
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isClicked = true;
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
        child:  _isClicked ? _buildAddColumnContainer(_controller) : _buildAddColumnOption()
      ),
    );
  }

    Widget _buildAddColumnOption() => Padding(
    padding: const EdgeInsets.only(top: primaryPaddingValue, left: primaryPaddingValue),
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
          Text("add new column",
            style: TextStyle(
              color: veryDarkGrey, 
              fontSize: smallTextFontSize,
            ),
          ),
        ],
      ),
    ),
  );


  Widget _buildAddColumnContainer(TextEditingController controller) => KeyboardListener(
    focusNode: FocusNode(),
    onKeyEvent: (KeyEvent event) {
      if (event.logicalKey == LogicalKeyboardKey.enter) {
        _kanban.storeKanbanColumn(controller.text);           
        widget.onColumnAdded();

        setState(() {
          _isClicked = false;
          controller.clear();
        });
      }
    },
    child: Padding(
      padding: const EdgeInsets.only(top: 8, left: primaryPaddingValue),
      child: Container(
        width: kanbanCardWidth - 4,
        height: 54,
        decoration: BoxDecoration(
          color: white,
          border: Border.all(color: mediumGrey, width: 2),
          borderRadius: BorderRadiusDirectional.circular(borderRadiusValue)
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: kanbanCardWidth - 40, height: 40,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: primaryPaddingValue),
                child: TextField(
                  maxLength: maxColumnTitleChars,
                  cursorColor: darkGrey,
                  style:  TextStyle(
                    color: darkGrey, 
                    fontSize: smallTextFontSize
                  ),
                  controller: controller,
                  decoration: InputDecoration(
                  hintText: "column title..",
                    border: InputBorder.none,
                  ),
                  autofocus: true,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
