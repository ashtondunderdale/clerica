import 'package:flutter/material.dart';
import 'dart:math';
import 'login_view.dart';

var list = ["task flow simplified", "visualise your workflow", "boost your productivity"];
var random = Random();

class WelcomeView extends StatelessWidget {
  WelcomeView({super.key});

  var element = list[random.nextInt(list.length)];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 180),
              child: Text(
                "welcome",
                style: TextStyle(
                  fontSize: 60,
                  color: Color.fromARGB(255, 86, 86, 86)
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 180),
              child: Text(
                element,
                style: TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 194, 194, 194)
                ),
              ),
            ),
          ),
          IconButton(
          onPressed: () {
            Navigator.push(context,MaterialPageRoute(builder: (context) => LoginView()));
          },
            icon: Icon(
              Icons.arrow_upward,
              size: 48,
              color: const Color.fromARGB(255, 189, 189, 189),
            )
          )
        ],
      ),    
    );
  }
}