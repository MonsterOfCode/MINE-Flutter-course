import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:fuel_calc_choice/widgets/button.dart';
import 'package:fuel_calc_choice/widgets/input.dart';

import 'button_loading.dart';

class FormWidget extends StatelessWidget {
  var fuelCtrl = new MoneyMaskedTextController();
  var gasCtrl = new MoneyMaskedTextController();
  var busy = false;
  Function onSubmit;

  FormWidget({
    @required this.fuelCtrl,
    @required this.gasCtrl,
    @required this.busy,
    @required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 30,
            right: 30,
          ),
          child: Input(label: "Fuel", ctrl: fuelCtrl),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 30,
            right: 30,
          ),
          child: Input(label: "Gas", ctrl: gasCtrl),
        ),
        ButtonLoading(
          action: onSubmit,
          label: "Calculate",
          busy: busy,
        ),
      ],
    );
  }
}
