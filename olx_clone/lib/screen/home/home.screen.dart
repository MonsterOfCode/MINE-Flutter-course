import 'package:flutter/material.dart';
import 'package:olx_clone/widgets/drawer/drawer.widget.dart';

class HomeScreen extends StatelessWidget {
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: DrawerWidget(),
        appBar: AppBar(),
      ),
    );
  }
}
