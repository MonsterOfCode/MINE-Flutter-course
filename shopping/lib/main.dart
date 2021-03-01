import 'package:flutter/material.dart';
import 'package:layouts/themes/dark-yellow.theme.dart';
import 'package:layouts/themes/dark.theme.dart';
import 'package:layouts/themes/light.theme.dart';
import 'package:layouts/widgets/tabs.widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: lightTheme(),
      home: DefaultTabController(
        length: 3,
        child: TabsWidget(),
      ),
    );
  }
}
