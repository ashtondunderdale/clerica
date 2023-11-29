import 'package:flutter/material.dart';

import '../utils/kanban_card_data.dart';
import '../widgets/appbar.dart';
import '../widgets/kanban_column.dart';
import '../widgets/side_bar.dart';
import '../widgets/side_box.dart';

class KanbanView extends StatelessWidget {
  KanbanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: KanbanAppbar(),
      body: Row(
        children: [
          SideBar(),
          SideBox(),
          Expanded(
            child: 
            Row(
              children: [
                KanbanColumn(columnTitle: "BACKLOG", columnCardList: backlogCards),
                KanbanColumn(columnTitle: "DEVELOPING", columnCardList: developingCards),
                KanbanColumn(columnTitle: "DEVELOPED", columnCardList: developedCards),
                KanbanColumn(columnTitle: "TESTING", columnCardList: testingCards),
                KanbanColumn(columnTitle: "TESTED", columnCardList: testedCards),
                KanbanColumn(columnTitle: "DONE", columnCardList: doneCards),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
