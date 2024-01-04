import 'package:flutter/material.dart';

import 'package:kanban_application/models/kanban_card.dart';
import 'package:kanban_application/utils/name_service.dart';
import 'package:kanban_application/widgets/kanban/expanded_card.dart';


class NewKanbanCard extends StatelessWidget {
  NewKanbanCard({super.key, required this.card, required this.columnWidth});

  final double columnWidth;
  final double cardHeight = 100;
  final double colourBorderWidth = 2.5;

  final KanbanCard card;
  final NameService nameService = NameService();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context){
            return AlertDialog(
              contentPadding: EdgeInsets.all(0),
              content: Container(
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      color: card.summary.contains("Case") ? Color.fromARGB(255, 255, 166, 160) : Color.fromARGB(255, 200, 149, 255),
                      width: 8
                    )
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                width: 900,
                height: 500,
                child: ExpandedCard(card: card, columnTitle: card.summary),
              ),
            );
          }
        );
      },
      key: ValueKey(card),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 4, top: 4),
        child: Draggable<KanbanCard>(
          data: card,
          feedback: Center(
            child: Container(
              width: columnWidth - 10,
              height: cardHeight,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onTertiaryContainer,
                borderRadius: BorderRadius.circular(2),
                border: Border(
                  left: BorderSide(
                    color: card.summary.contains("Case") ? Color.fromARGB(255, 255, 166, 160) : Color.fromARGB(255, 200, 149, 255), 
                    width: colourBorderWidth,
                  )
                ),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.15),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: DefaultTextStyle(
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                          child: Text(
                            card.project.toUpperCase(),             
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 4, top: 8),
                        child: DefaultTextStyle(
                          style: TextStyle(
                            color: card.status == "Fail Test" ? Color.fromARGB(255, 255, 166, 160) : Color.fromARGB(255, 255, 187, 160),
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          child: Text(
                            card.status == "Fail Test" ? "F" : (card.status == "With Torchbearer" ? "WT" : ""),
                          ),
                        ),
                      )
                    ],
                  ),
                  DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 12,
                      color: card.status == "Complete" || 
                                  card.status == "Ready For Release" || 
                                  card.status == "Ready for Release" || 
                                  card.status == "Released" ? Theme.of(context).colorScheme.onPrimary.withOpacity(0.5) : Theme.of(context).colorScheme.onSurfaceVariant,
                  
                      decoration: card.status == "Complete" || 
                                  card.status == "Ready For Release" || 
                                  card.status == "Ready for Release" || 
                                  card.status == "Released" ? TextDecoration.lineThrough : TextDecoration.none
                    ),
                    child: Text(
                      card.summary,
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Tooltip(
                        message: card.ownedBy,
                        child: Container(
                          width: 26,
                          height: 26,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.onTertiary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              nameService.getInitials(card.ownedBy),
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onSurfaceVariant,
                                fontSize: 12,
                                fontWeight: FontWeight.normal
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Icon(
                          Icons.arrow_forward_outlined,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                          size: 12,
                        ),
                      ),
                      Tooltip(
                        message: card.assignedTo,
                        child: Container(
                          width: 26,
                          height: 26,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.onTertiary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              nameService.getInitials(card.assignedTo),
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onSurfaceVariant,
                                fontSize: 12,
                                fontWeight: FontWeight.normal
                              ),
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 4, bottom: 4),
                        child: DefaultTextStyle(
                            style: TextStyle(
                            fontSize: 12,
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),                         
                          child: Text(
                            card.storyPoints.toString(),

                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          childWhenDragging: Center(
            child: Container(
              width: columnWidth - 10,
              height: cardHeight,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onTertiaryContainer.withOpacity(0.5),
                borderRadius: BorderRadius.circular(2),
                border: Border(
                  left: BorderSide(
                    color: card.summary.contains("Case") ? Color.fromARGB(255, 255, 166, 160) : Color.fromARGB(255, 200, 149, 255), 
                    width: colourBorderWidth,
                  )
                ),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.15),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text(
                          card.project.toUpperCase(),
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: Text(
                          card.status == "Fail Test" ? "F" : (card.status == "With Torchbearer" ? "WT" : ""),
                          style: TextStyle(
                            color: card.status == "Fail Test" ? Color.fromARGB(255, 255, 166, 160) : Color.fromARGB(255, 255, 187, 160),
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                  Text(
                    card.summary,
                    style: TextStyle(
                      fontSize: 12,
                      color: card.status == "Complete" || 
                                  card.status == "Ready For Release" || 
                                  card.status == "Ready for Release" || 
                                  card.status == "Released" ? Theme.of(context).colorScheme.onPrimary.withOpacity(0.5) : Theme.of(context).colorScheme.onSurfaceVariant,

                      decoration: card.status == "Complete" || 
                                  card.status == "Ready For Release" || 
                                  card.status == "Ready for Release" || 
                                  card.status == "Released" ? TextDecoration.lineThrough : TextDecoration.none
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Tooltip(
                        message: card.ownedBy,
                        child: Container(
                          width: 26,
                          height: 26,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.onTertiary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              nameService.getInitials(card.ownedBy),
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onSurfaceVariant,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Icon(
                          Icons.arrow_forward_outlined,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                          size: 12,
                        ),
                      ),
                      Tooltip(
                        message: card.assignedTo,
                        child: Container(
                          width: 26,
                          height: 26,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.onTertiary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              nameService.getInitials(card.assignedTo),
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onSurfaceVariant,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 4, bottom: 4),
                        child: Text(
                          card.storyPoints.toString(),
                          style: TextStyle(
                            fontSize: 10,
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          child: Center(
            child: Container(
              width: columnWidth - 10,
              height: cardHeight,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onTertiaryContainer,
                borderRadius: BorderRadius.circular(2),
                border: Border(
                  left: BorderSide(
                    color: card.summary.contains("Case") ? Color.fromARGB(255, 255, 166, 160) : Color.fromARGB(255, 200, 149, 255), 
                    width: colourBorderWidth,
                  )
                ),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.15),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text(
                          card.project.toUpperCase(),
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: Text(
                          card.status == "Fail Test" ? "F" : (card.status == "With Torchbearer" ? "WT" : ""),
                          style: TextStyle(
                            color: card.status == "Fail Test" ? Color.fromARGB(255, 255, 166, 160) : Color.fromARGB(255, 255, 187, 160),
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                  Text(
                    card.summary,
                    style: TextStyle(
                      fontSize: 12,
                      color: card.status == "Complete" || 
                                  card.status == "Ready For Release" || 
                                  card.status == "Ready for Release" || 
                                  card.status == "Released" ? Theme.of(context).colorScheme.onPrimary.withOpacity(0.5) : Theme.of(context).colorScheme.onSurfaceVariant,

                      decoration: card.status == "Complete" || 
                                  card.status == "Ready For Release" || 
                                  card.status == "Ready for Release" || 
                                  card.status == "Released" ? TextDecoration.lineThrough : TextDecoration.none
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Tooltip(
                        message: nameService.getInitials(card.ownedBy) == "??" ? "Nobody" : card.ownedBy,
                        margin: EdgeInsets.only(left: 6),
                        textStyle: TextStyle(
                          color: Theme.of(context).colorScheme.onTertiary,
                          fontSize: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onPrimary,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          width: 26,
                          height: 26,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.onTertiary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              nameService.getInitials(card.ownedBy) == "??" ? "?" : nameService.getInitials(card.ownedBy),
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onSurfaceVariant,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Icon(
                          Icons.arrow_forward_outlined,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,                              
                          size: 10,
                        ),
                      ),
                      Tooltip(
                        message: nameService.getInitials(card.assignedTo) == "??" ? "Nobody" : card.assignedTo,
                        margin: EdgeInsets.only(left: 6),
                        textStyle: TextStyle(
                          color: Theme.of(context).colorScheme.onTertiary,
                          fontSize: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onPrimary,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          width: 26,
                          height: 26,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.onTertiary,
                            borderRadius: BorderRadius.circular(220),
                          ),
                          child: Center(
                            child: Text(
                              nameService.getInitials(card.assignedTo) == "??" ? "?" : nameService.getInitials(card.assignedTo),
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onSurfaceVariant,
                                fontSize: 10
                              ),
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 4, bottom: 4),
                        child: Text(
                          card.storyPoints.toString(),
                          style: TextStyle(
                            fontSize: 12,
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),        
        ),           // admin_panel_settings_outlined, assignment_ind_outlined, bug_report_outlined, content_paste_go, person_add_alt, supervised_user_circle_outlined
      ),
    );
  }
}