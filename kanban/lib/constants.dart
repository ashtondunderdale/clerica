import 'package:flutter/material.dart';


/// looks nicer
/// 
/// used in:
///     - everywhere
/// 
const Color white = Colors.white;
const Color black = Colors.black;


/// mainly used for lighter backgrounds
///
/// used in:
///    - kanban_column.dart
///
const Color lightGrey = Color.fromARGB(255, 245, 245, 245);


/// mainly used for less lighter backgrounds
///
/// used in:
///    
const Color mediumGrey = Color.fromARGB(255, 226, 226, 226);


/// mainly used for darker backgrounds
///
/// used in:
///    - kanban_column.dart
///
const Color darkGrey = Color.fromARGB(255, 165, 165, 165);


/// mainly used for darker backgrounds and text
///
/// used in:
///    - kanban_column.dart
///
const Color veryDarkGrey = Color.fromARGB(255, 91, 91, 91);


/// --------------------------------------------------------------------- ///


/// other constants
/// 
const double borderRadiusValue = 4;
const double primaryPaddingValue = 8;
const double secondaryPaddingValue = 4;

const double kanbanColumnWidth = 260;
const double kanbanCardHeight = 90;
const double kanbanCardWidth = kanbanColumnWidth - 16;

const double smallTextFontSize = 13;