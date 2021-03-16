import 'package:flutter/material.dart';
import 'package:perfect_eggs/blocs/app.bloc.dart';
import 'package:perfect_eggs/widgets/mybutton.widget.dart';
import 'package:provider/provider.dart';

class TypeButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<AppBloc>(context);
    return bloc.state == "stopped" ? buttons(bloc) : SizedBox();
  }

  Widget buttons(AppBloc bloc) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        MyButton(
          label: "Soft",
          callback: () {
            bloc.select("soft");
          },
          selected: bloc.selected == "soft",
        ),
        MyButton(
          label: "Medium",
          callback: () {
            bloc.select("medium");
          },
          selected: bloc.selected == "medium",
        ),
        MyButton(
          label: "Hard",
          callback: () {
            bloc.select("hard");
          },
          selected: bloc.selected == "hard",
        )
      ],
    );
  }
}
