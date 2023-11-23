import 'package:flutter/material.dart';

class KanbanColumnTop extends StatelessWidget {
  const KanbanColumnTop({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double columnWidth = screenWidth / 8;

    return Padding(
      padding: const EdgeInsets.only(top: 70),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: columnWidth,
              height: 50,
              decoration: BoxDecoration(
                border: Border(  
                  top: BorderSide(
                    color: Color.fromARGB(255, 235, 235, 235),
                    width: 3,
                  ),
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              color: Colors.white,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Color.fromARGB(255, 97, 97, 97),
                      fontWeight: FontWeight.bold,
                      fontSize: 12
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
