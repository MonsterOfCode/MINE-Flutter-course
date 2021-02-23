import 'package:flutter/material.dart';
import 'package:fuel_calc_choice/widgets/button.dart';

class ButtonLoading extends StatelessWidget {
  var busy = false;
  var label = "";
  Function action;
  var textColor;
  var btnColor;

  ButtonLoading({
    @required this.action,
    @required this.label,
    @required this.busy,
    this.textColor,
    this.btnColor,
  });

  @override
  Widget build(BuildContext context) {
    return busy
        ? Container(
            alignment: Alignment.center,
            height: 50,
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
            ),
          )
        : Button(
            label: label,
            action: action,
            btnColor: btnColor,
            textColor: textColor,
          );
  }
}
