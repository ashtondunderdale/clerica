import 'package:flutter/material.dart';
import 'card.dart';

String previousColumn = "";
String movingCard = "";
double cardWidth = 200;
double cardHeight = 60;
double columnHeight = 50;

Map<String, List<KanbanCard>> kanbanBoard = {
  "BACKLOG": [
    KanbanCard(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      cardName: "Card 1",
    ),
  ],
  "DEVELOPING": [
    KanbanCard(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      cardName: "Card 2",
    ),
  ],
  "DEVELOPED": [
    KanbanCard(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      cardName: "Card 3",
    ),
  ],
  "TESTING": [
    KanbanCard(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      cardName: "Card 4",
    ),
  ],
  "TESTED": [
    KanbanCard(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      cardName: "Card 5",
    ),
  ],
  "DONE": [
    KanbanCard(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      cardName: "Card 6",
    ),
  ],
};