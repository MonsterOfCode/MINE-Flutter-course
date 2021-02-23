import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  var label;
  var textColor;
  var btnColor;
  Function action;

  Button({
    @required this.label,
    @required this.action,
    this.textColor,
    this.btnColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: btnColor ?? Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(
          60,
        ),
      ),
      child: FlatButton(
        onPressed: action,
        child: Text(
          label,
          style: TextStyle(
            color: textColor ?? Theme.of(context).primaryColor,
            fontFamily: "Big Shoulders Display",
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
