import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class APITest extends StatefulWidget {
  const APITest({super.key});

  @override
  State<APITest> createState() => _APITestState();
}

class _APITestState extends State<APITest> {

  List<dynamic> users = [];

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        testAPI();
      },
      child: Text("API"),
    );
  }

  void testAPI() async {
    final response = await http.get(Uri.parse("https://randomuser.me/api/?results=1"));
    final json = jsonDecode(response.body);

    setState(() => users = json['results']);

    for (var user in users) {
      print(user['email']);
    }
  }
}