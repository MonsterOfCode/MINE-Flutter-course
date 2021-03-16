import 'package:flutter/material.dart';
import 'package:perfect_eggs/blocs/app.bloc.dart';
import 'package:perfect_eggs/widgets/action_buttons.widget.dart';
import 'package:perfect_eggs/widgets/eggs.widget.dart';
import 'package:perfect_eggs/widgets/progress.widget.dart';
import 'package:perfect_eggs/widgets/type_buttons.widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<AppBloc>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Text(
                "Perfect Eggs",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Eggs(),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TypeButtons(),
              ),
              Progress(),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: ActionButtons(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
