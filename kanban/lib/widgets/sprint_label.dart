import 'package:flutter/material.dart';

class SprintLabel extends StatelessWidget {
  const SprintLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 26, bottom: 4),
      child: Tooltip(
        height: 40,
        message: "1/12/23 ⇒ 15/12/23",
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 198, 198, 198),
        ),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1)
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 2, bottom: 2, left: 8, right: 8),
            child: Text(
              'SPRINT 17',
              style: TextStyle(
                color: const Color.fromARGB(255, 77, 77, 77),
                fontWeight: FontWeight.bold,
                fontSize: 12
              ),
            ),
          ),
        ),
      ),
    );
  }
}