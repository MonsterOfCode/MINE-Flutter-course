import 'package:flutter/cupertino.dart';
import 'package:imc/blocs/imc.bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var bloc = new IMCBloc();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Check Your IMC"),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 8.0, right: 8.0),
          child: Column(
            children: [
              CupertinoTextField(
                placeholder: "Heigth (cm)",
                keyboardType: TextInputType.number,
                controller: bloc.heightCtrl,
              ),
              SizedBox(height: 15),
              CupertinoTextField(
                placeholder: "Weight (Kg)",
                keyboardType: TextInputType.number,
                controller: bloc.weightCtrl,
              ),
              SizedBox(height: 30),
              Text(
                bloc.result,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50),
              Container(
                width: double.infinity,
                child: CupertinoButton.filled(
                  onPressed: () {
                    setState(() {
                      bloc.calculate();
                    });
                  },
                  child: Text(
                    "Calculate",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
