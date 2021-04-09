import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:olx_clone/ui/screen/abs/create.screen.dart';
import 'package:olx_clone/ui/screen/home/home.screen.dart';
import 'package:olx_clone/business_logic/stores/screen.store.dart';

class BaseScreen extends StatefulWidget {
  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final PageController pageController = PageController();

  final ScreenStore store = GetIt.I<ScreenStore>();

  @override
  void initState() {
    super.initState();

    reaction(
      (_) => store.page,
      (newPage) => pageController.jumpToPage(newPage),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          HomeScreen(),
          CreateAbScreen(),
          Container(
            color: Colors.yellow,
          ),
          Container(
            color: Colors.purple,
          ),
          Container(
            color: Colors.brown,
          ),
        ],
      ),
    );
  }
}
