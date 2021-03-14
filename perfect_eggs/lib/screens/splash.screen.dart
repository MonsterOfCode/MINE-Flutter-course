// ignore: import_of_legacy_library_into_null_safe
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:perfect_eggs/screens/home.screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    delay(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              flex: 4,
              child: Container(),
            ),
            Flexible(
              flex: 3,
              child: Container(
                child: FlareActor(
                  "assets/animations/egg-cooking.flr",
                  alignment: Alignment.center,
                  fit: BoxFit.cover,
                  isPaused: false,
                  animation: "start",
                ),
              ),
            ),
            Flexible(
              flex: 4,
              child: Container(
                child: Text(
                  "Perfect Eggs",
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future delay(context) async {
    await new Future.delayed(new Duration(milliseconds: 3000), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    });
  }
}
