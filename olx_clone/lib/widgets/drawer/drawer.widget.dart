import 'package:flutter/material.dart';
import 'package:olx_clone/widgets/drawer/drawer_header.widget.dart';
import 'package:olx_clone/widgets/drawer/drawer_screen_section.widget.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.horizontal(right: Radius.circular(30)),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        child: Drawer(
          child: ListView(
            children: [
              DrawerHeaderWidget(),
              DrawerScreensSectionWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
