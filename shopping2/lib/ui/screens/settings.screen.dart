import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping2/blocs/theme.bloc.dart';

import '../../settings.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeBloc bloc = Provider.of<ThemeBloc>(context);

    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 60,
          ),
          Text(
            "Current Theme: ${Settings.theme}",
            textAlign: TextAlign.center,
          ),
          TextButton(
            child: Text("Light"),
            onPressed: () {
              save("light");
              bloc.change('light');
            },
          ),
          TextButton(
            child: Text("Dark"),
            onPressed: () {
              save("dark");
              bloc.change('dark');
            },
          ),
          TextButton(
            child: Text("Dark Yellow"),
            onPressed: () {
              save("dark-yellow");
              bloc.change('dark-yellow');
            },
          ),
        ],
      ),
    );
  }

  save(theme) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme', theme);
  }
}
