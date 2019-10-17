import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _weightController = TextEditingController();
  TextEditingController _heightController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoText = "";

  void _resertFields() {
    _weightController.text = "";
    _heightController.text = "";
    setState(() {
      _infoText = "";
      _formKey = GlobalKey<FormState>();
    });
  }

  void _calculateIMC() {
    double weight = double.parse(_weightController.text);
    double height = double.parse(_heightController.text) / 100;
    double imc = (weight / (height * height));
    print(imc);
    setState(() {
      if (imc < 18.6) {
        _infoText =
            "IMC: ${imc.toStringAsPrecision(3)}, under of weight recomended!";
      } else if (imc >= 18.6 && imc < 24.9) {
        _infoText = "IMC: ${imc.toStringAsPrecision(3)}, good weight!";
      } else if (imc >= 24.9 && imc < 29.9) {
        _infoText =
            "IMC: ${imc.toStringAsPrecision(3)}, a little over of weight!";
      } else if (imc >= 29.9 && imc < 34.9) {
        _infoText = "IMC: ${imc.toStringAsPrecision(3)}, obesity I";
      } else if (imc >= 34.9 && imc < 39.9) {
        _infoText = "IMC: ${imc.toStringAsPrecision(3)}, obesity II";
      } else {
        _infoText = "IMC: ${imc.toStringAsPrecision(3)}, obesity III";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("IMC Calculator"),
          centerTitle: true,
          backgroundColor: Colors.black54,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: _resertFields,
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Icon(Icons.person_outline,
                      size: 120.0, color: Colors.black54),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Weight (Kg)",
                        labelStyle: TextStyle(color: Colors.black54)),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black54, fontSize: 25.0),
                    controller: _weightController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Insert your Weight";
                      }
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Height (cm)",
                        labelStyle: TextStyle(color: Colors.black54)),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black54, fontSize: 25.0),
                    controller: _heightController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Insert your Height";
                      }
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Container(
                      height: 50.0,
                      child: RaisedButton(
                        onPressed: (){
                          if(_formKey.currentState.validate()){
                            _calculateIMC();
                          }
                        },
                        child: Text("Calculate",
                            style:
                                TextStyle(fontSize: 25.0, color: Colors.white)),
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  Text(
                    "$_infoText",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black54, fontSize: 25.0),
                  )
                ],
              ),
            )));
  }
}
