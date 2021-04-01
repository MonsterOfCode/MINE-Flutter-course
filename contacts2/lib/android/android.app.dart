import 'package:contacts2/android/screens/home.screen.dart';
import 'package:contacts2/android/screens/splash.screen.dart';
import 'package:contacts2/android/styles.dart';
import 'package:flutter/material.dart';

class AndroidApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Contacts',
        debugShowCheckedModeBanner: false,
        theme: androidTheme(),
        home: HomeScreen());
  }
}
