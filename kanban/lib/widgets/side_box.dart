import 'package:flutter/material.dart';

double calculateSideBoxWidth(BuildContext context) {
  return MediaQuery.of(context).size.width / widthConstant;
}

  double widthConstant = 8;

class SideBox extends StatefulWidget {
  const SideBox({Key? key}) : super(key: key);

  @override
  _SideBoxState createState() => _SideBoxState();
}

class _SideBoxState extends State<SideBox> {
  @override
  Widget build(BuildContext context) {
    double sideBoxWidth = MediaQuery.of(context).size.width / widthConstant;

    return Padding(
      padding: const EdgeInsets.only(right: 0),
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
