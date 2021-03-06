import 'package:flutter/material.dart';
import 'package:layouts/widgets/animated_input.widget.dart';

class SearchWidget extends StatefulWidget {
  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget>
    with SingleTickerProviderStateMixin {
  bool menuOpened = false;
  AnimationController _controller;

  @override
  void initState() {
    _controller = new AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AnimatedInput(
          controller: _controller,
        ),
        FlatButton(
          onPressed: () {
            !menuOpened ? _controller.forward() : _controller.reverse();
            menuOpened ^= true;
          },
          child: AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: _controller,
            semanticLabel: "Open Menu",
          ),
        )
      ],
    );
  }
}
