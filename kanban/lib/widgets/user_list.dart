import 'package:flutter/material.dart';
import 'package:kanban_application/main.dart';
import 'package:kanban_application/utils/api.dart';
import 'package:kanban_application/utils/name_service.dart';

import '../utils/data.dart';

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
                  child: GestureDetector(
                    onTap: () async {
                        
                      for (int i = 0; i < kanbanData.length; i++){
                        kanbanData[i].cards.clear(); // < / <=
                      }  

                      await api.getPhases("Specific User Project Phases", users[user].toString());

                      setState(() {
                        currentTheme.updateColumns();
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 48,
                      height: MediaQuery.of(context).size.width / 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).colorScheme.onTertiary,
                        border: Border.all(color: nameService.getCurrentUser(user, Theme.of(context).colorScheme.onPrimary, Theme.of(context).colorScheme.onTertiary), width: 2)
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