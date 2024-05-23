import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kanban_application/board/services/kanban_service.dart';

import '../../../constants.dart';
import '../../models/kanban_card_model.dart';


class KanbanCard extends StatefulWidget {
  const KanbanCard({Key? key, required this.card, required this.onCardRemoved});

  final KanbanCardModel card;
  final VoidCallback onCardRemoved;

  @override
  State<KanbanCard> createState() => _KanbanCardState();
}

class _KanbanCardState extends State<KanbanCard> {
  KanbanService _kanban = KanbanService();
  final TextEditingController _cardTitleController = TextEditingController();

  Color _backgroundColor = white;
  bool _isHovered = false;
  bool _isEditingTitle = false;
  bool _isActive = false;

  @override
  void initState() {
    super.initState();
    _cardTitleController.text = widget.card.title;
  }

  @override
  Widget build(BuildContext context) => widget.card.isVisible ? Padding(
    padding: const EdgeInsets.all(secondaryPaddingValue),
    child: GestureDetector(
      child: Draggable<KanbanCardModel>(
        data: widget.card,
        feedback: widget,
        childWhenDragging: _buildDraggingCard(),
        child: MouseRegion(
          onEnter: (_) {
            setState(() => _isHovered = true);
          },
          onExit: (_) {
            setState(() {
              _isHovered = false;
            });
          },
          child: _buildCardBody()
        ),
      ),
    ),
  ) : SizedBox();

  Widget _buildCardBody() => AnimatedContainer(
    duration: _isHovered || _isActive ? Duration(milliseconds: 200) : Duration(milliseconds: 100),
    width: kanbanCardWidth,
    height: kanbanCardHeight,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(borderRadiusValue),
      color: _isHovered ? lightGrey : _backgroundColor,
      boxShadow: [
        BoxShadow(
          color: darkGrey,
          blurRadius: 2,
          spreadRadius: 0,
          offset: const Offset(-0.5, 1),
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.all(primaryPaddingValue),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: kanbanCardWidth - 40,
                child: _buildTitle(_cardTitleController)
              ),
              Spacer(),
              _isHovered || _isActive ? _buildBinIcon() : SizedBox(),
            ],
          ),
          Spacer(),
          Row(
            children: [
              //_buildCardType(widget.card.cardType.name),
              Spacer(),
              _isHovered || _isActive ? _buildText(widget.card.id) : SizedBox()
            ],
          )
        ],
      ),
    ),
  );


  // Widget _buildCardType(String cardType) {
  //   return MouseRegion(
  //     cursor: SystemMouseCursors.click,
  //     child: GestureDetector(
  //       onTap: () {
  //         var cardTypes = CardType.values.toList();
          
  //         var matchingCardType = CardType.values.where((e) => e.name == widget.card.cardType.name).first;
  //         int i = cardTypes.indexOf(matchingCardType);
      
  //         setState(() {
  //           if (i >= 0 && i < cardTypes.length - 1) {   
  //             widget.card.cardType = cardTypes[i + 1];
  //           } else {
  //             widget.card.cardType = cardTypes.first;
  //           }
  //         });
      
  //         _kanban.storeKanbanCard(widget.card);
  //       },
  //       child: Container(
  //         height: 18,
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(borderRadiusValue*4),
  //           border: Border.all(color: mediumGrey)
  //         ),
  //         child: Padding(
  //           padding: const EdgeInsets.only(left: secondaryPaddingValue, right: secondaryPaddingValue),
  //           child: Center(
  //             child: DefaultTextStyle(   
  //               style: TextStyle(
  //                 color: widget.card.cardType == CardType.maths ? mathsColor 
  //                   : widget.card.cardType == CardType.programming ? programmingColor 
  //                   : widget.card.cardType == CardType.general ? bugColor 
  //                   : widget.card.cardType == CardType.life ? issueColor 
  //                   : widget.card.cardType == CardType.health ? orderColor : mediumGrey, 
  //                 fontSize: 11,
  //               ),
  //               child: Text(cardType),
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _buildTitle(TextEditingController controller) => _isEditingTitle
    ? SizedBox(
        width: kanbanCardWidth - 40,
        child: KeyboardListener(
          focusNode: FocusNode(),
          onKeyEvent: (event) {
            if (event.logicalKey == LogicalKeyboardKey.enter) {
              setState(() {
                _isEditingTitle = false;
                widget.card.title = controller.text;

                _kanban.storeKanbanCard(widget.card);
              });
            }
          },
          child: SizedBox(
            width: kanbanCardWidth - 40,
            height: 16,
            child: TextField(
              maxLength: maxTaskChars,
              cursorColor: darkGrey,
              style:  TextStyle(
                color: darkGrey, 
                fontSize: smallTextFontSize
              ),
              controller: controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                counter: SizedBox.shrink()
              ),
              autofocus: true,
            ),
          ),
        ),
      )
    : Row(
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(secondaryPaddingValue),
              child: _buildText(
                widget.card.title,
              ),
            ),
          ),
          _isHovered
              ? Padding(
                  padding: const EdgeInsets.all(secondaryPaddingValue),
                  child: GestureDetector(
                    onTap: () {
                      setState(() => _isEditingTitle = true);
                    },
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Icon(
                        Icons.edit,
                        color: darkGrey,
                        size: 13,
                      ),
                    ),
                  ),
                )
              : SizedBox(),
        ],
      );


  Widget _buildBinIcon() => MouseRegion(
    cursor: SystemMouseCursors.click,
    child: GestureDetector(
      onTap: () {
        _kanban.removeCard(widget.card);
        widget.onCardRemoved();
      },
      child: Icon(
        Icons.delete,
        color: darkGrey,
        size: 16,
      ),
    ),
  );

  Widget _buildText(String text) => DefaultTextStyle(   
    style: TextStyle(
      color: darkGrey, 
      fontSize: smallTextFontSize,
    ),
    child: Text(text),
  );

  Widget _buildDraggingCard() => Container(
    width: kanbanCardWidth,
    height: kanbanCardHeight,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(borderRadiusValue),
      color: mediumGrey,
    )
  );
}