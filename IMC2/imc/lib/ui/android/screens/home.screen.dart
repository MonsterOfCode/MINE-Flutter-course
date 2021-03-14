import 'package:flutter/material.dart';
import 'package:imc/blocs/imc.bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var bloc = new IMCBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Check you IMC"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 8.0, right: 8.0),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Heigth (cm)",
                ),
                keyboardType: TextInputType.number,
                controller: bloc.heightCtrl,
              ),
              SizedBox(height: 15),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Weight (Kg)",
                ),
                keyboardType: TextInputType.number,
                controller: bloc.weightCtrl,
              ),
              SizedBox(height: 30),
              Text(
                bloc.result,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50),
              FlatButton(
                  color: Theme.of(context).primaryColor,
                  minWidth: double.infinity,
                  onPressed: () {
                    setState(() {
                      bloc.calculate();
                    });
                  },
                  child: Text(
                    "Calculate",
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
