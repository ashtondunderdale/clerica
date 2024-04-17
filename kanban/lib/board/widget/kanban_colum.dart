import 'package:flutter/material.dart';

import '../../constants.dart';
import '../models/kanban_card_model.dart';
import '../models/kanban_column_model.dart';
import 'kanban_card.dart';


class KanbanColumn extends StatelessWidget {
  const KanbanColumn({super.key, required this.column});

  final KanbanColumnModel column;

  @override
  Widget build(BuildContext context) => _buildColumn(context, column.title);

  Widget _buildColumn(BuildContext context, String title) => Padding(
    padding: const EdgeInsets.all(primaryPaddingValue),
    child: Container(
      width: kanbanColumnWidth,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: lightGrey,
        borderRadius: BorderRadius.circular(borderRadiusValue)),
      child: Padding(
        padding: const EdgeInsets.all(primaryPaddingValue),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: primaryPaddingValue, right: primaryPaddingValue, bottom: primaryPaddingValue*2),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildText(title),
                  Spacer(),
                  _buildText(column.itemCount.toString()),
                ],
              ),
            ),
            _buildCards(column.cards),
          ],
        ),
      ),
    ),
  );

  Widget _buildCards(List<KanbanCardModel> cards) => Column(
    children: cards.map((card) => KanbanCard(card: card)).toList()
  );

  Widget _buildText(String text) => Text(
    text,
    style: TextStyle(
      fontWeight: FontWeight.w500, 
      color: darkGrey, 
      fontSize: smallTextFontSize
    ),
  );
}