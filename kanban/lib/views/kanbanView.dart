import 'package:flutter/material.dart';

import '../widgets/appbar.dart';
import '../widgets/logout_button.dart';
import '../widgets/side_bar.dart';
import '../widgets/side_box.dart';


class KanbanView extends StatelessWidget {
  const KanbanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: KanbanAppbar(

      ),
      body: Row(
        children: [
          SideBar(),
          SideBox(),
        ],
      ),
    );
  }
}