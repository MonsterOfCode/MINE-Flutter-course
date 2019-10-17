import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: "People Counter", home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 0;
  String _infoText = "May Come In!";

  void _updatePeople(int delta) {
    setState(() {
      _people += delta;
    });
    if (_people < 0) {
      _infoText = "World is changing?";
    } else if (_people <= 10) {
      _infoText = "May Come In!";
    } else {
      _infoText = "Completed!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: Stack(
          children: <Widget>[
            Image.asset(
              "images/restaurant.jpg",
              fit: BoxFit.cover,
              height: 1000,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "People: $_people",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 80.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: FlatButton(
                        child: Text(
                          "+1",
                          style: TextStyle(fontSize: 40.0, color: Colors.white),
                        ),
                        onPressed: () {
                          _updatePeople(1);
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: FlatButton(
                        child: Text(
                          "-1",
                          style: TextStyle(fontSize: 40.0, color: Colors.white),
                        ),
                        onPressed: () {
                          _updatePeople(-1);
                        },
                      ),
                    ),
                  ],
                ),
                Text(
                  _infoText,
                  style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontSize: 30.0),
                )
              ],
            ),
          ],
        ));
  }
}
