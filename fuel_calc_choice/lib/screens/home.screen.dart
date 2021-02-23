import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:fuel_calc_choice/widgets/form.dart';
import 'package:fuel_calc_choice/widgets/logo.dart';
import 'package:fuel_calc_choice/widgets/result.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _color = Colors.deepPurple;
  var _fuelCtrl = new MoneyMaskedTextController();
  var _gasCtrl = new MoneyMaskedTextController();
  var _busy = false;
  var _completed = false;
  var _resultText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AnimatedContainer(
        duration: Duration(
          milliseconds: 1200,
        ),
        color: _color,
        child: ListView(
          children: [
            Logo(),
            _completed
                ? Result(
                    buttonAction: reset,
                    result: _resultText,
                    buttonLabel: "Reset",
                  )
                : FormWidget(
                    fuelCtrl: _fuelCtrl,
                    gasCtrl: _gasCtrl,
                    busy: _busy,
                    onSubmit: calculate,
                  )
          ],
        ),
      ),
    );
  }

  Future calculate() {
    double fuel =
        double.parse(_fuelCtrl.text.replaceAll(new RegExp(r"[,.]"), "")) / 100;
    double gas =
        double.parse(_gasCtrl.text.replaceAll(new RegExp(r"[,.]"), "")) / 100;
    double res = fuel / gas;
    setState(() {
      _color = Colors.blue;
      _completed = false;
      _busy = true;
    });

    return new Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        if (res >= 0.7) {
          _resultText = "Fuel is the best choice";
        } else {
          _resultText = "Gas is the best choice";
        }
        _completed = true;
        _busy = false;
      });
    });
  }

  void reset() {
    setState(() {
      _fuelCtrl = new MoneyMaskedTextController();
      _gasCtrl = new MoneyMaskedTextController();
      _busy = false;
      _completed = false;
      _color = Colors.deepPurple;
    });
  }
}
