import 'package:flutter/material.dart';
import 'package:kanban_application/board/services/kanban_service.dart';
import 'package:kanban_application/board/widgets/add_card_button.dart';

import '../../../constants.dart';
import '../../models/kanban_card_model.dart';
import '../../models/kanban_column_model.dart';
import 'kanban_card.dart';

class KanbanColumn extends StatefulWidget {
  const KanbanColumn(
      {Key? key,
      required this.column,
      required this.onCardMoved,
      required this.capitalText, 
      required this.onColumnRemoved
    });

  final KanbanColumnModel column;
  final Function(KanbanCardModel, KanbanColumnModel) onCardMoved;
  final bool capitalText;

  final VoidCallback onColumnRemoved;

  @override
  State<KanbanColumn> createState() => _KanbanColumnState();
}

class _KanbanColumnState extends State<KanbanColumn> {
  final _kanban = KanbanService();

  bool _isHovered = false;
  bool _isColumnTopHovered = false;

  @override
  Widget build(BuildContext context) => _buildColumn(context, widget.column.title);

  Widget _buildColumn(BuildContext context, String title) => Padding(
    padding: const EdgeInsets.all(primaryPaddingValue),
    child: DragTarget<KanbanCardModel>(
      onAcceptWithDetails: (card) =>
          widget.onCardMoved(card.data, widget.column),
      builder: (context, candidateData, rejectedData) => MouseRegion(
        onEnter: (enter) {
          setState(() => _isHovered = true);
        },
        onExit: (exit) {
          setState(() => _isHovered = false);
        },
        child: Container(
          width: kanbanColumnWidth,
          decoration: BoxDecoration(
            color: lightGrey,
            borderRadius: BorderRadius.circular(borderRadiusValue)
          ),
          child: Padding(
            padding: const EdgeInsets.all(primaryPaddingValue),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: primaryPaddingValue,
                    right: primaryPaddingValue,
                    bottom: primaryPaddingValue * 2
                  ),
                  child: MouseRegion(
                    onEnter: (_) {
                      setState(() => _isColumnTopHovered = true);
                    },
                    onExit: (_) {
                      setState(() => _isColumnTopHovered = false);
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildText(title),
                        Spacer(),
                        _isColumnTopHovered ? _buildDeleteColumnIcon() : SizedBox(),
                        _buildAnimatedItemCount(widget.column.itemCount),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        _buildCards(widget.column.cards),
                        _isHovered ? AddCardButton(
                          column: widget.column,
                          onCardAdded: () {
                            widget.column.itemCount = widget.column.cards.length;
                            setState(() {});
                          }) : SizedBox(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );

  Widget _buildCards(List<KanbanCardModel> cards) => Column(
  children: cards
    .map((card) => KanbanCard(
      card: card,
      onCardRemoved: () {
        widget.column.itemCount = widget.column.cards.length;
        setState(() {});
      }
    )).toList(),
  );

  Widget _buildText(String text) => Text(
    widget.capitalText
      ? text.replaceAll('_', ' ').toUpperCase()
      : text.replaceAll('_', ' ').toLowerCase(),
    style: TextStyle(
      fontWeight: FontWeight.w500,
      color: veryDarkGrey,
      fontSize: smallTextFontSize
    ),
  );

  Widget _buildAnimatedItemCount(int itemCount) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: itemCount > 0 ? const Offset(0.0, 0.5) : const Offset(0.0, -0.5),
            end: Offset.zero,
          ).animate(CurvedAnimation(parent: animation, curve: Curves.ease)),
          child: FadeTransition(
            opacity: Tween<double>(begin: 0, end: 1).animate(animation),
            child: child,
          ),
        );
      },
      child: Text(
        itemCount.toString(),
        key: ValueKey<int>(itemCount),
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: veryDarkGrey,
          fontSize: smallTextFontSize,
        ),
      ),
    );
  }

  Widget _buildDeleteColumnIcon() => MouseRegion(
    cursor: SystemMouseCursors.click,
    child: Padding(
      padding: const EdgeInsets.only(right: primaryPaddingValue),
      child: GestureDetector(
        onTap: () async {
          await _kanban.removeKanbanColumn(widget.column.title);
          widget.onColumnRemoved();
          
          setState(() {});          
        },
        child: Icon(
          Icons.delete,
          color: darkGrey,
          size: 16,
        ),
      ),
    ),
  );
}
