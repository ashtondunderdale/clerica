import 'package:flutter/material.dart';

class MovingCard extends StatelessWidget {
  const MovingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 200,
      child: Card(
        color: Colors.grey[400],
        child: ListTile(
          title: Text(
            'Moving Here...',
            style: TextStyle(
              color: Colors.white,
            ),
          )
        ),
      ),
    );
  }
}