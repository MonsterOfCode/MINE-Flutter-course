import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const requestUrl = "https://api.hgbrasil.com/finance?format=json&key=a313c026";

void main() async {
  runApp(
    MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        hintColor: Colors.white,
        primaryColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    ),
  );
}

Future<Map> getCoins() async {
  http.Response response = await http.get(requestUrl);
  return jsonDecode(response.body);
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double _dollar, _euro, _bitCoin;

  final bitCoinController = TextEditingController();
  final euroController = TextEditingController();
  final dollarController = TextEditingController();

  // Conversions not working well, just the concept is good
  void _bitCoinChanging(String text) {
    double bitCoin = double.parse(text);
    dollarController.text = (bitCoin / _dollar).toStringAsFixed(2);
    euroController.text = (bitCoin / _euro).toStringAsFixed(2);
  }

  void _euroChanging(String text) {
    double euro = double.parse(text);
    dollarController.text = (euro / _dollar).toStringAsFixed(2);
    bitCoinController.text = (euro / _bitCoin).toStringAsFixed(2);
  }

  void _dollarChanging(String text) {
    double dollar = double.parse(text);
    euroController.text = (dollar / _euro).toStringAsFixed(2);
    bitCoinController.text = (dollar / _bitCoin).toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black54,
        appBar: AppBar(
          title: Text("\$ Converter \$"),
          backgroundColor: Colors.amber,
          centerTitle: true,
        ),
        body: FutureBuilder<Map>(
          future: getCoins(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Center(
                  child: Text(
                    "Loading data...",
                    style: TextStyle(color: Colors.amber, fontSize: 25.0),
                    textAlign: TextAlign.center,
                  ),
                );
                break;
              default:
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      "Error loading data 🤨",
                      style: TextStyle(color: Colors.amber, fontSize: 25.0),
                      textAlign: TextAlign.center,
                    ),
                  );
                } else {
                  _dollar =
                      snapshot.data["results"]["currencies"]["USD"]["buy"];
                  _euro = snapshot.data["results"]["currencies"]["EUR"]["buy"];
                  _bitCoin =
                      snapshot.data["results"]["currencies"]["BTC"]["buy"];
                  return SingleChildScrollView(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Icon(Icons.monetization_on,
                            size: 150.0, color: Colors.amber),
                        buildTextField(
                            "Bitcoin", "", bitCoinController, _bitCoinChanging),
                        Divider(),
                        buildTextField(
                            "Euro", "€", euroController, _euroChanging),
                        Divider(),
                        buildTextField(
                            "Dollar", "\$", dollarController, _dollarChanging)
                      ],
                    ),
                  );
                }
            }
          },
        ));
  }
}

Widget buildTextField(String label, String sufix,
    TextEditingController controller, Function changehandler) {
  return TextField(
    decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.amber),
        border: OutlineInputBorder(),
        suffixText: " $sufix"),
    style: TextStyle(color: Colors.amber, fontSize: 25.0),
    controller: controller,
    onChanged: changehandler,
    keyboardType: TextInputType.numberWithOptions(decimal: true),
  );
}
