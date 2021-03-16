import 'package:flutter/material.dart';
import 'package:perfect_eggs/blocs/app.bloc.dart';
import 'package:perfect_eggs/widgets/mybutton.widget.dart';
import 'package:provider/provider.dart';

class ActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<AppBloc>(context);

    switch (bloc.state) {
      case "cooking":
        return MyButton(
          label: "STOP",
          selected: true,
          callback: bloc.stop,
        );
      case "done":
        return MyButton(
          label: "ALL DONE",
          selected: true,
          callback: bloc.reset,
        );
      default:
        return MyButton(
          label: "START",
          selected: true,
          callback: bloc.start,
        );
    }
  }
}
