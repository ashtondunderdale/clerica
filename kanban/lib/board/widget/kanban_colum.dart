import 'package:flutter/material.dart';
import 'package:kanban_application/constants.dart';

class KanbanColumn extends StatelessWidget {
  const KanbanColumn({super.key, 
    required this.title, 
    required this.itemCount
  });

  final String title;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return _buildColumn(context, title);
  }

  Widget _buildColumn(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.all(paddingValue),
      child: Container(
        width: kanbanColumnWidth,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            color: lightGrey,
            borderRadius: BorderRadius.circular(borderRadiusValue)),
        child: Padding(
          padding: const EdgeInsets.all(paddingValue),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildText(title),
              Spacer(),
              _buildText(itemCount.toString()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w500, 
        color: darkGrey, 
        fontSize: smallTextFontSize
      ),
    );
  }
}