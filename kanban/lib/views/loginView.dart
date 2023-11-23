import 'package:flutter/material.dart';

import '../widgets/login_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(222, 3, 24, 85),
                Color.fromARGB(255, 180, 185, 255),
                Color.fromARGB(255, 115, 192, 255),
              ]
            )
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 500,
                  width: 400,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: SizedBox(
                        height: 50,
                        child: RichText(
                          text: TextSpan(
                            text: 'Login with ',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                            children: [
                              TextSpan(
                                text: 'Epicor',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                      SizedBox(
                        width: 300,
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Username',
                            suffixIcon: Icon(Icons.perm_identity_outlined)
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 300,
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            suffixIcon: Icon(Icons.password_outlined)
                          ),
                        ),
                      ),
                      SizedBox(height: 200),
                      LoginButton()
                    ]
                  ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
