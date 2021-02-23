import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:fuel_calc_choice/screens/home.screen.dart';
import 'package:fuel_calc_choice/widgets/button.dart';
import 'package:fuel_calc_choice/widgets/form.dart';
import 'package:fuel_calc_choice/widgets/input.dart';
import 'package:fuel_calc_choice/widgets/button_loading.dart';
import 'package:fuel_calc_choice/widgets/logo.dart';
import 'package:fuel_calc_choice/widgets/result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gas or Fuel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
