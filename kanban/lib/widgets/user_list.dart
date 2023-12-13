import 'package:flutter/material.dart';

import '../utils/data.dart';

class UserList extends StatelessWidget {
  UserList({super.key});

  Map<String,String> users  = {
    "proden"       : "Peter Roden",
    "jsweeney"     : "Josh Sweeney",
    "bwojda"       : "Bart Wojda",
    "adunderdale"  : "Ashton Dunderdale",
    "ho'leary"     : "Harrison O'Leary",
    "cglover"      : "Charlie Glover",
  };

  String getInitials(String name){    

    try{
      var firstNameAndLastName = name.split(' ');

      String firstName = firstNameAndLastName[0];
      String lastName = firstNameAndLastName[1];

      String firstInitial = firstName[0];
      String lastInitial = lastName[0];

      return firstInitial + lastInitial;
    }
    catch (exception){
      return name[0] + name[1];
    }
  }
  
  Color getCurrentUser(String user, Color UserLoggedInColour, Color UserNotLoggedInColour){
    String currentUser = loggedInUser;
    String currentUserName = "";

    if (currentUser.contains(' ')) currentUserName = currentUser.split(' ')[0][0] + currentUser.split(' ')[1].toLowerCase();

    if (currentUser == user || currentUser == currentUserName) {
      return UserLoggedInColour;
    } else {
      return UserNotLoggedInColour;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.0, right: MediaQuery.of(context).size.width / 6.6 / 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          for (var user in users.keys)
          Tooltip(
            message: user == loggedInUser ? "You" : users[user].toString(),
            textStyle: TextStyle(
              color: Theme.of(context).colorScheme.onTertiary,
              fontSize: 10,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Stack(
              children: [ 
                Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 48,
                    height: MediaQuery.of(context).size.width / 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context).colorScheme.onTertiary,
                      border: Border.all(color: getCurrentUser(user, Theme.of(context).colorScheme.onPrimary, Theme.of(context).colorScheme.onTertiary), width: 2)
                    ),
                    child: Center(
                      child: Text(
                        getInitials(user).toUpperCase(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                             color: Theme.of(context).colorScheme.onPrimary,
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