import 'package:flutter/material.dart';

double calculateSideBoxWidth(BuildContext context) {
  return MediaQuery.of(context).size.width / 5.5;
}

class SideBox extends StatelessWidget {
  const SideBox({Key? key});

  @override
  Widget build(BuildContext context) {
    double sideBoxWidth = MediaQuery.of(context).size.width / 5.5;

    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        width: sideBoxWidth,
        height: MediaQuery.of(context).size.height,
        color: const Color.fromARGB(255, 66, 66, 66),
      ),
    );
  }
}

double returnSideBoxWidth(BuildContext context) {
  return calculateSideBoxWidth(context);
}
