import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
              colors: [
                Color(const Color.fromARGB(255, 161, 213, 255).value),
                Color(const Color.fromARGB(255, 202, 238, 255).value),
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
                        decoration: InputDecoration(
                         labelText: "email",
                          labelStyle: TextStyle(
                            fontSize: 14
                          ),    
                          suffixIcon: Icon(
                            Icons.email_outlined,
                            size: 18,
                            )
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: SizedBox(
                      width: 240,
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "password",
                          labelStyle: TextStyle(
                            fontSize: 14
                          ),                          
                          suffixIcon: Icon(
                            Icons.password_outlined,
                            size: 18,
                          )
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 120),
                    child: Container(
                      width: 160,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: Container(
                        width: 160,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Color.fromARGB(255, 183, 212, 255),
                            ),
                          ),
                        ),
                      )
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
