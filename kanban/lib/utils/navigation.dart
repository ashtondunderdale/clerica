import 'package:flutter/material.dart';
import 'package:kanban_application/views/kanbanView.dart';

import '../views/home.dart';

void navigateToPage(BuildContext context, String pageName) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => getPage(pageName)));
}

Widget getPage(String pageName) {
  switch (pageName) {
    
    case 'homeView':
      return HomeView();

    case 'kanbanView':
      return KanbanView();

    default:
      throw Exception('Invalid page name: $pageName');
  }
}