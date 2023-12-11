import 'package:flutter/material.dart';

class UserList extends StatelessWidget {
  UserList({super.key});

  List<String> users = [
    "Peter Roden",
    "Josh Sweeney",
    "Bart Wojda",
    "Ashton Dunderdale",
    "Harrison O'Leary",
    "Charlie Glover",
  ];

  String getInitials(String name){    
    var firstNameAndLastName = name.split(' ');

    String firstName = firstNameAndLastName[0];
    String lastName = firstNameAndLastName[1];

    String firstInitial = firstName[0];
    String lastInitial = lastName[0];

    return firstInitial + lastInitial;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, right: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          for (var user in users)
            Tooltip(
              message: user,
              child: Stack(
                children: [ 
                  Padding(
                    padding: const EdgeInsets.only(left: 2),
                    child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 223, 223, 223),
                    ),
                    child: Center(
                      child: Text(
                        getInitials(user),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                    ),
                                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}