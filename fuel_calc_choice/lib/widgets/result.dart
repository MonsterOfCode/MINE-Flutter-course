import 'package:flutter/material.dart';
import 'package:fuel_calc_choice/widgets/button.dart';
import 'package:fuel_calc_choice/widgets/button_loading.dart';

class Result extends StatelessWidget {
  var invert = true;
  Function buttonAction;
  var result = "";
  var buttonLabel = "";

  Result({
    @required this.buttonAction,
    @required this.result,
    @required this.buttonLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Text(
            result,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontFamily: "Big Shoulders Display",
              fontSize: 40,
            ),
          ),
          Button(
            label: buttonLabel,
            action: buttonAction,
            btnColor: invert
                ? Theme.of(context).primaryColor
                : Colors.white.withOpacity(0.8),
            textColor: invert ? Colors.white : Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}
