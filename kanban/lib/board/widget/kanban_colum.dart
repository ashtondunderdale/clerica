import 'package:flutter/material.dart';

class KanbanColumn extends StatelessWidget {
  const KanbanColumn({super.key, required this.title, required this.itemCount});

  final String title;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        width: 240,
        height: MediaQuery.sizeOf(context).height,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 245, 245, 245),
          borderRadius: BorderRadius.circular(4)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontSize: 12
                ),
              ),
              Spacer(),
              Text(
                itemCount.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontSize: 12
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}