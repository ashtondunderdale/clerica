import 'package:flutter/material.dart';

class KanbanColumnTop extends StatelessWidget {
  const KanbanColumnTop({super.key, required this.title, required this.cardAmount});

  final String title;
  final int cardAmount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        width: MediaQuery.of(context).size.width / 6.6 - 10,
        height: 40,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSecondary,
          borderRadius: BorderRadius.circular(2),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.15),
              spreadRadius: 1,
              blurRadius: 4,
              offset: Offset(0, 1)
            ),
          ],
          border: Border(
            top: BorderSide(
              color: Theme.of(context).colorScheme.onTertiary, 
              width: 2, 
            )
          )
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title, 
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 12
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Text(
                cardAmount.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 12,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}