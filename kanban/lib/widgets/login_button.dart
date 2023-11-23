import 'package:flutter/material.dart';

import '../utils/navigation.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => navigateToPage(context, 'kanbanView'),
      child: Container(
        alignment: Alignment.center,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(222, 3, 24, 85),
              Color.fromARGB(255, 180, 185, 255),
              Color.fromARGB(255, 115, 192, 255),
            ]
          ),
        ),
        child: SizedBox(
          height: 40,
          child: Center(
            child: Text(
              'Login',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}