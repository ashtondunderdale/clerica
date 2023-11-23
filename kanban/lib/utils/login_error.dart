import 'package:flutter/material.dart';

void showFlashError(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.white,
      content: Text(
        message,
        style: TextStyle(
          color: Color.fromARGB(255, 255, 104, 93),
        ),
        ),
    ),
  );
}