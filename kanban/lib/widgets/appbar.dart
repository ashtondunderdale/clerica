import 'package:flutter/material.dart';
import '../widgets/side_bar.dart';
import '../widgets/side_box.dart';

class KanbanAppbar extends StatelessWidget implements PreferredSizeWidget {
  const KanbanAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        alignment: Alignment.center,
        color: const Color.fromARGB(255, 192, 192, 192),
        width: MediaQuery.of(context).size.width - (returnSideBarWidth(context) + calculateSideBoxWidth(context)),
        child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {},
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Kanban Board',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(0, 70);
}