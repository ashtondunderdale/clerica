import 'package:flutter/material.dart';

class UserList extends StatelessWidget {
  UserList({super.key});

  final List<String> users = [
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
      padding: EdgeInsets.only(bottom: 8.0, right: MediaQuery.of(context).size.width / 6.6 / 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          for (var user in users)
          Tooltip(
            message: user,
            child: Stack(
              children: [ 
                Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 48,
                    height: MediaQuery.of(context).size.width / 48,
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
                          fontSize: MediaQuery.of(context).size.width > 1800 ? 14 : 12,
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