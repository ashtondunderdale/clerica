import 'package:flutter/material.dart';

double calculateSideBarWidth(BuildContext context) {
  return MediaQuery.of(context).size.width / 40;
}

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    double sideBarWidth = calculateSideBarWidth(context);

    return Container(
      width: sideBarWidth,
      height: MediaQuery.of(context).size.height,
      color: Color.fromARGB(255, 137, 137, 137),
    );
  }
}

double returnSideBarWidth(BuildContext context) {
  return calculateSideBarWidth(context);
}
