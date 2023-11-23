import 'package:flutter/material.dart';
import '../utils/navigation.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: FloatingActionButton(
        onPressed: () => _showLogoutConfirmationDialog(context),
        backgroundColor: Color.fromARGB(255, 175, 195, 230),
        elevation: 4.0, 
        mini: true,
        splashColor: Color.fromARGB(255, 136, 140, 207),
        child: Icon(
          Icons.exit_to_app,
          color: Colors.white, 
          size: 20,
        ),
      ),
    );
  }

  Future<void> _showLogoutConfirmationDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'LOGOUT',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 60, 60, 60),
            ),
          ),
          content: Text(
            'Are you sure you want to log out?',
            style: TextStyle(
              color: const Color.fromARGB(221, 110, 110, 110),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'No',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0)
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                navigateToPage(context, 'loginView');
              },
              child: Text(
                'Yes',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0)
                ),
              ),
            ),
          ],
          backgroundColor: Color.fromARGB(255, 255, 255, 255), 
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        );
      },
    );
  }
}