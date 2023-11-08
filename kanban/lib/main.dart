import 'package:flutter/material.dart';

void main() {
  runApp(KanBanApplication());
}

class KanBanApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Dashboard(),
    );
  }
}

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kanban Application',
          style: TextStyle(
            color: Color.fromARGB(255, 138, 210, 243),
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            width: 200, 
            height: 700,
            color: Color.fromARGB(255, 248, 248, 248),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  color: const Color.fromARGB(255, 167, 216, 255), 
                  child: Text(
                    'Backlog',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, 
                    ),
                  ),
                ),
              ],
            ),
          )
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            width: 200, 
            height: 700,
            color: Color.fromARGB(255, 248, 248, 248),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  color: const Color.fromARGB(255, 167, 216, 255), 
                  child: Text(
                    'In Development',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, 
                    ),
                  ),
                ),
              ],
            ),
          )
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            width: 200, 
            height: 700,
            color: Color.fromARGB(255, 248, 248, 248),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  color: const Color.fromARGB(255, 167, 216, 255), 
                  child: Text(
                    'Developed',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, 
                    ),
                  ),
                ),
              ],
            ),
          )
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            width: 200, 
            height: 700,
            color: Color.fromARGB(255, 248, 248, 248),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  color: const Color.fromARGB(255, 167, 216, 255), 
                  child: Text(
                    'In Test',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, 
                    ),
                  ),
                ),
              ],
            ),
          )
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            width: 200, 
            height: 700,
            color: Color.fromARGB(255, 248, 248, 248),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  color: const Color.fromARGB(255, 167, 216, 255), 
                  child: Text(
                    'Tested',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, 
                    ),
                  ),
                ),
              ],
            ),
          )
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            width: 200, 
            height: 700,
            color: Color.fromARGB(255, 248, 248, 248),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  color: const Color.fromARGB(255, 167, 216, 255), 
                  child: Text(
                    'Done',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, 
                    ),
                  ),
                ),
              ],
            ),
          )
          ),
        ],
      ),
    );
  }
}
