import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String label;
  final bool selected;
  final Function callback;

  MyButton({
    required this.label,
    required this.callback,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 110,
      decoration: BoxDecoration(
        color: selected ? Theme.of(context).primaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(width: 1, color: Theme.of(context).primaryColor),
      ),
      child: TextButton(
        onPressed: () => callback(),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
