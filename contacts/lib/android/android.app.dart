import 'package:contacts/android/screens/home.screen.dart';
import 'package:contacts/android/screens/splash.screen.dart';
import 'package:contacts/android/styles.dart';
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
