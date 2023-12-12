import 'package:flutter/material.dart';

class SprintLabel extends StatelessWidget {
  const SprintLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 26, bottom: 4),
      child: Tooltip(
        height: 30,
        message: "1/12/23 ⇒ 15/12/23",
        textStyle: TextStyle(
          color: Theme.of(context).colorScheme.onTertiary,
          fontSize: 12,
        ),
        decoration: BoxDecoration(            
          borderRadius: BorderRadius.circular(4),
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromARGB(255, 180, 180, 180), 
              width: 1
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 2, bottom: 2, left: 8, right: 8),
            child: Text(
              'SPRINT 17',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.width > 1800 ? 13 : 11,
              ),
            ),
          ),
        ),
      ),
    );
  }
}