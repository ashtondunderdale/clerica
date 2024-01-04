import 'dart:ui';

import 'package:kanban_application/models/data.dart';

class NameService{

String getInitials(String name)
  {    
    try
    {
      var firstNameAndLastName = name.split(' ');

      String firstName = firstNameAndLastName[0];
      String lastName = firstNameAndLastName[1];

      String firstInitial = firstName[0];
      String lastInitial = lastName[0];

      return firstInitial + lastInitial;
    }
    catch (exception)
    {
      return name[0] + name[1];
    }
  }

  Color getCurrentUser(String user, Color userLoggedInColour, Color userNotLoggedInColour)
  {
    String currentUser = loggedInUser;
    String currentUserName = "";

    if (currentUser.contains(' ')) currentUserName = currentUser.split(' ')[0][0] + currentUser.split(' ')[1].toLowerCase();

    if (currentUser == user || currentUser == currentUserName) 
    {
      return userLoggedInColour;
    } 
    else 
    {
      return userNotLoggedInColour;
    }
  }

}