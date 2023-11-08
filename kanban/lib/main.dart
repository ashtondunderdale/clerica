import 'package:flutter/material.dart';

void main() {
  runApp(KanBanApplication());
}

class KanBanApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          shape: Border(
            bottom: BorderSide(
              color: Color.fromARGB(255, 241, 241, 241),
              width: 2.0,
            ),
          ),
          actions: <Widget>[
            Row(
              children: [
                DropDown(),
                SizedBox(width: 16), 
                Container(
                  padding: EdgeInsets.only(right: 1100, left: 100), 
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Text(
                    'Sprint 16',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontSize: 14,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(1),
                  child: Text(
                    '06/11/2023 -> 17/11/2023',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontSize: 14,
                    ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              height: 750, 
              child: Dashboard(),
            ),
          ],
        ),
      ),
    );
  }
}


class DropDown extends StatefulWidget {
  const DropDown({Key? key}) : super(key: key);

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String dropDownValue = 'Default';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton<String>(
        value: dropDownValue,
        icon: const Icon(Icons.menu),
        style: const TextStyle(color: Color.fromARGB(255, 87, 87, 87)),
        underline: Container(
          height: 2,
          color: Color.fromARGB(255, 90, 90, 90),
        ),

        onChanged: (String? newValue) {
          setState(() {
            dropDownValue = newValue!;
          });
        },

        items: [
          DropdownMenuItem<String>(
            value: 'Default',
            child: Text('Default'),
          ),

          DropdownMenuItem<String>(
            value: 'All',
            child: Text('All'),
          ),
          
          DropdownMenuItem<String>(
            child: PopupMenuButton<String>(
              itemBuilder: (context) {
                return <PopupMenuEntry<String>>[

                  PopupMenuItem<String>(
                    value: 'Peter Roden',
                    child: Text('Peter Roden'),
                  ),

                  PopupMenuItem<String>(
                    value: 'Susannah Marshall',
                    child: Text('Susannah Marshall'),
                  ),

                  PopupMenuItem<String>(
                    value: 'Josh Sweeney',
                    child: Text('Josh Sweeney'),
                  ),

                  PopupMenuItem<String>(
                    value: 'Bart Wojda',
                    child: Text('Bart Wojda'),
                  ),

                  PopupMenuItem<String>(
                    value: 'Ashton Dunderdale',
                    child: Text('Ashton Dunderdale'),
                  ),

                  PopupMenuItem<String>(
                    value: 'Harrison O\'Leary',
                    child: Text('Harrison O\'Leary'),
                  ),
                  
                  PopupMenuItem<String>(
                    value: 'Charlie Glover',
                    child: Text('Charlie Glover'),
                  ),
                ];
              },

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Specific'),
                  Icon(Icons.arrow_right_rounded),
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
    
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
            width: MediaQuery.of(context).size.width * 0.15,
            color: Color.fromARGB(255, 248, 248, 248),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    color: Color.fromARGB(255, 106, 180, 240),
                    height: 40,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Backlog',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
            width: MediaQuery.of(context).size.width * 0.15,
            color: Color.fromARGB(255, 248, 248, 248),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    color: Color.fromARGB(255, 55, 142, 212),
                    height: 40,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'In Development',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
            width: MediaQuery.of(context).size.width * 0.15,
            color: Color.fromARGB(255, 248, 248, 248),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    color: Color.fromARGB(255, 47, 119, 179),
                    height: 40,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Developed',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
            width: MediaQuery.of(context).size.width * 0.15,
            color: Color.fromARGB(255, 248, 248, 248),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    color: Color.fromARGB(255, 115, 156, 189),
                    height: 40,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'In Test',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
            width: MediaQuery.of(context).size.width * 0.15,
            color: Color.fromARGB(255, 248, 248, 248),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    color: Color.fromARGB(255, 51, 90, 122),
                    height: 40,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Tested',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

                    Container(
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
            width: MediaQuery.of(context).size.width * 0.15,
            color: Color.fromARGB(255, 248, 248, 248),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    color: Color.fromARGB(255, 13, 101, 173),
                    height: 40,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Done',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
