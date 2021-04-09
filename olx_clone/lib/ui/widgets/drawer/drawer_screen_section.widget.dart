import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:olx_clone/business_logic/stores/screen.store.dart';
import 'package:olx_clone/ui/widgets/drawer/drawer_item.widget.dart';

class DrawerScreensSectionWidget extends StatelessWidget {
  final ScreenStore store = GetIt.I<ScreenStore>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DrawerItemWidget(label: "Abs", iconData: Icons.list, onTap: () => store.setScreen(0), highlighted: store.page == 0),
        DrawerItemWidget(label: "New Ab", iconData: Icons.edit, onTap: () => store.setScreen(1), highlighted: store.page == 1),
        DrawerItemWidget(label: "Chat", iconData: Icons.chat, onTap: () => store.setScreen(2), highlighted: store.page == 2),
        DrawerItemWidget(label: "Favorites", iconData: Icons.favorite, onTap: () => store.setScreen(3), highlighted: store.page == 3),
        DrawerItemWidget(label: "Account", iconData: Icons.person, onTap: () => store.setScreen(4), highlighted: store.page == 4),
      ],
    );
  }
}
