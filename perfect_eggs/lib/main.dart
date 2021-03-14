import 'package:flutter/material.dart';
import 'package:perfect_eggs/screens/splash.screen.dart';
import 'package:perfect_eggs/themes/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Perffect Egges',
      theme: appTheme(),
      home: SplashScreen(),
    );
  }
}
