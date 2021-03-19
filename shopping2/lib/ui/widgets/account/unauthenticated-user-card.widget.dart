import 'package:flutter/material.dart';
import 'package:shopping2/ui/screens/login.screen.dart';
import 'package:shopping2/ui/screens/signup.screen.dart';

class UnauthenticatedUserCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(
          height: 60,
        ),
        TextButton(
          child: Text("Login"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
            );
          },
        ),
        TextButton(
          child: Text("Sign up"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignupScreen(),
              ),
            );
          },
        ),
      ],
    );
  }
}
