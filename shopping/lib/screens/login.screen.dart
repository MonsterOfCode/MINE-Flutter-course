import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Color(0xFFF5F5F5),
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Column(
            children: [
              Container(
                height: 450,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    new BoxShadow(
                      color: Colors.black12,
                      offset: new Offset(1, 2.0),
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: ListView(
                  children: [
                    Padding(padding: EdgeInsets.all(8)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Welcome",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text("Sing in to continue"),
                          ],
                        ),
                        FlatButton(
                          onPressed: () {},
                          child: Text("Sign up"),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
