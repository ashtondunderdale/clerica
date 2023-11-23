import 'package:flutter/material.dart';
import 'package:kanban_application/widgets/logout_button.dart';
import '../globals.dart';
import '../widgets/side_box.dart';

import 'package:flutter/material.dart';
import 'package:kanban_application/widgets/logout_button.dart';

class KanbanAppbar extends StatefulWidget implements PreferredSizeWidget {
  const KanbanAppbar({Key? key}) : super(key: key);

  @override
  _KanbanAppbarState createState() => _KanbanAppbarState();

  @override
  Size get preferredSize => Size(0, 50);
}

class _KanbanAppbarState extends State<KanbanAppbar> {
  bool isUserInfoVisible = false;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        alignment: Alignment.center,
        color: Color.fromARGB(255, 236, 236, 236),
        width: MediaQuery.of(context).size.width - (50 + calculateSideBoxWidth(context)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: IconButton(
                icon: Icon(Icons.menu),
                color: Color.fromARGB(255, 138, 138, 138),
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                companyName,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 138, 138, 138),
                ),
              ),
            ),
            Spacer(),
            LogoutButton(),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: IconButton(
                    iconSize: 30,
                    icon: Icon(Icons.account_circle_outlined),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text(
                              'USER INFO',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("User: ${usernameTextController.text}"), 
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Close'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
