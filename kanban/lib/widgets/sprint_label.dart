import 'package:flutter/material.dart';

class SprintLabel extends StatelessWidget {
  const SprintLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: SizedBox(
        width: 80,
        height: 20,
        child: Text(
          'SPRINT 17',
          style: TextStyle(
            color: const Color.fromARGB(255, 121, 121, 121)
          ),
        ),
      ),
    );
  }
}