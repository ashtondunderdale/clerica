import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../utils/data.dart';
import 'kanban_view.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  FlutterSecureStorage storage = FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    _setTextBoxValues();
  }

  _setTextBoxValues() async {
    var username = await storage.read(key: "username") ?? "";
    var password = await storage.read(key: "password") ?? "";

    usernameController.text = username;
    passwordController.text = password;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(0, 255, 255, 255),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: [
                Color(Color.fromARGB(255, 161, 161, 161).value),
                Theme.of(context).colorScheme.background,
              ],
            ),
          ),
          child: Center(
            child: Container(
              width: 400,
              height: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 80),
                    child: SizedBox(
                      width: 240,
                      child: TextField(
                        controller: usernameController,
                        style: TextStyle(
                          fontSize: 10,
                        ),
                        cursorColor: Theme.of(context).colorScheme.onPrimary,
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.onPrimary)),
                          labelText: "username",
                          labelStyle: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                          suffixIcon: Icon(
                            Icons.email_outlined,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: SizedBox(
                      width: 240,
                      child: TextField(
                        controller: passwordController,
                        style: TextStyle(
                          fontSize: 12,
                          letterSpacing: 2,
                        ),
                        cursorColor: Theme.of(context).colorScheme.onPrimary,
                        obscureText: true,
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.onPrimary)),
                          labelText: "password",
                          labelStyle: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                          suffixIcon: Icon(
                            Icons.password_outlined,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 260),
                    child: Container(
                      width: 120,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_validateInputs()) {
                            loggedInUser = usernameController.text;

                            storage.write(key: "username", value: usernameController.text);
                            storage.write(key: "password", value: passwordController.text);

                            Navigator.push(context, MaterialPageRoute(builder: (context) => KanbanView()));
                          } else {
                            _showErrorSnackBar("Username and password cannot be empty.");
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          surfaceTintColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Icon(
                          Icons.login,
                          color: const Color.fromARGB(255, 91, 91, 91),
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool _validateInputs() {
    return usernameController.text.isNotEmpty && passwordController.text.isNotEmpty;
  }

  void _showErrorSnackBar(String errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(errorMessage),
        backgroundColor: const Color.fromARGB(255, 255, 130, 121),
      ),
    );
  }
}
