import 'package:flutter/material.dart';
import 'package:kanban_application/views/kanban_view.dart';

import '../views/login_view.dart';

void navigateToPage(BuildContext context, String pageName) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => getPage(pageName)));
}

Widget getPage(String pageName) {
  switch (pageName) {

    case 'loginView':
      return LoginView();

    case 'kanbanView':
      return KanbanView();

    default:
      throw Exception('Invalid page name: $pageName');
  }
}