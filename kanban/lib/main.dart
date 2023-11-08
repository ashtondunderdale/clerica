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
            Padding(
              padding: EdgeInsets.only(right: 1200), 
              child: DropDown(),
            ),
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              height: 600, 
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
        items: const [
          DropdownMenuItem<String>(
            value: 'Default',
            child: Text('Default'),
          ),
          DropdownMenuItem<String>(
            value: 'All',
            child: Text('All'),
          ),
          DropdownMenuItem<String>(
            value: 'Specific',
            child: Text('Specific'),
          ),
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
            width: 200, 
            height: 700,
            color: Color.fromARGB(255, 248, 248, 248),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    color: Color.fromARGB(255, 156, 210, 255), 
                    child: Text(
                      'Backlog',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white, 
                      ),
                    ),
                  ),
                ],
              ),
            )
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
            width: 200, 
            height: 700,
            color: Color.fromARGB(255, 248, 248, 248),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  color: Color.fromARGB(255, 106, 180, 240), 
                  child: Text(
                    'In Development',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white, 
                    ),
                  ),
                ),
              ],
            ),
          )
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
            width: 200, 
            height: 700,
            color: Color.fromARGB(255, 248, 248, 248),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  color: Color.fromARGB(255, 28, 118, 192), 
                  child: Text(
                    'Developed',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white, 
                    ),
                  ),
                ),
              ],
            ),
          )
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
            width: 200, 
            height: 700,
            color: Color.fromARGB(255, 248, 248, 248),
          child: ClipRRect(           
            borderRadius: BorderRadius.circular(10),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  color: Color.fromARGB(255, 103, 140, 170), 
                  child: Text(
                    'In Test',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white, 
                    ),
                  ),
                ),
              ],
            ),
          )
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
            width: 200, 
            height: 700,
            color: Color.fromARGB(255, 248, 248, 248),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  color: Color.fromARGB(255, 19, 109, 184), 
                  child: Text(
                    'Tested',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white, 
                    ),
                  ),
                ),
              ],
            ),
          )
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
            width: 200, 
            height: 700,
            color: Color.fromARGB(255, 248, 248, 248),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  color: Color.fromARGB(255, 137, 202, 255), 
                  child: Text(
                    'Done',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
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
