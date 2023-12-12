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
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(2),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(-2, 2),
            ),
          ],
          border: const Border(
            top: BorderSide(
              color: Color.fromARGB(255, 208, 208, 208), 
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
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 80, 80, 80),
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
                  color: const Color.fromARGB(255, 100, 100, 100),
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