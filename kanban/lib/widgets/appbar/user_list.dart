import 'package:flutter/material.dart';

import 'package:kanban_application/models/data.dart';
import 'package:kanban_application/utils/api_service.dart';
import 'package:kanban_application/utils/name_service.dart';
import 'package:kanban_application/utils/theme/theme.dart';


class UserList extends StatefulWidget {
  UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  final ApiService api = ApiService();

  NameService nameService = NameService();

  @override
  Widget build(BuildContext context) 
  {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.0, right: MediaQuery.of(context).size.width / 6.6 / 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          for (var user in users.keys)
          Tooltip(
            margin: EdgeInsets.only(left: 6),
            message: user == loggedInUser ? "You" : users[user].toString(),
            textStyle: TextStyle(
              color: user == loggedInUser ? Color.fromARGB(255, 255, 255, 255) : Theme.of(context).colorScheme.onTertiary,
              fontSize: 10,
              fontWeight: user == loggedInUser ? FontWeight.bold : FontWeight.normal
            ),
            decoration: BoxDecoration(
              color: user == loggedInUser ? Color.fromARGB(255, 143, 143, 143) : Theme.of(context).colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [ 
                Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: GestureDetector(
                    onTap: () async {       
                      api.clearKanban();
          
                      await api.getPhases("Specific User Project Phases", users[user].toString());
                      setState(() => currentTheme.updateColumns());
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 48,
                      height: MediaQuery.of(context).size.width / 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).colorScheme.onTertiary,
                        border: Border.all(color: nameService.getCurrentUser(user, Colors.grey, Theme.of(context).colorScheme.onTertiary), width: 2)
                      ),
                      child: Center(
                        child: Text(
                          nameService.getInitials(user).toUpperCase(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: MediaQuery.of(context).size.width > 1800 ? 14 : 12,
                          ),
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