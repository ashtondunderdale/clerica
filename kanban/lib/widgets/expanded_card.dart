import 'package:flutter/material.dart';

class ExpandedCard extends StatelessWidget {
  const ExpandedCard({super.key, required this.summary, required this.columnTitle});

  final String summary;
  final String columnTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4)
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                summary.toUpperCase(),
                style: TextStyle(
                  fontSize: 20,
                  decoration: columnTitle == "DONE" ? TextDecoration.lineThrough : TextDecoration.none,
                  color: columnTitle == "DONE" ? Colors.grey : const Color.fromARGB(255, 68, 68, 68),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 8, top: 24),
                child: Container(
                  width: 600,
                  height: 360,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey)
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}