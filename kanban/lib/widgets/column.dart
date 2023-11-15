import 'package:flutter/material.dart';
import 'globals.dart';

class KanbanColumnTitle extends StatelessWidget {
  const KanbanColumnTitle({
    Key? key,
    required this.columnTitle,
  }) : super(key: key);

  final String columnTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.all(4),
          child: SizedBox(
            height: columnHeight,
            width: MediaQuery.of(context).size.width * 0.15,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              shadowColor: Colors.black,
              elevation: 2.0,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: const BorderRadius.all(Radius.circular(8),
                  ),
                  border: Border(
                    top: BorderSide(
                      color: Color.fromARGB(255, 124, 176, 255),
                      width: 2.5,
                    ),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 204, 204, 204).withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: ListTile(
                  title: Text(
                    columnTitle,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 44, 44, 44),
                    ),
                  ),
                ),
              ),
            ),
          )
        ),
      ],
    );
  }
}