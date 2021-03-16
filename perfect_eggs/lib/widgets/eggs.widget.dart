import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:perfect_eggs/blocs/app.bloc.dart';
import 'package:provider/provider.dart';

class Eggs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<AppBloc>(context);

    switch (bloc.state) {
      case "cooking":
        return animation("boiling");
      case "done":
        return animation("egg-cooking");
      default:
        return animation("eggs");
    }
  }

  Widget animation(String animation) {
    return Container(
      width: 300,
      height: 300,
      child: FlareActor(
        "assets/animations/$animation.flr",
        alignment: Alignment.center,
        fit: BoxFit.contain,
        isPaused: false,
        animation: 'start',
      ),
    );
  }
}
