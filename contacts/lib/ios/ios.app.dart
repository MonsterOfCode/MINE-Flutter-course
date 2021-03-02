import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IOSApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Contacts',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(child: Text("ok")),
      ),
    );
  }
}
