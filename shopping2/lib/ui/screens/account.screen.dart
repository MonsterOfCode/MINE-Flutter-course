import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping2/blocs/user.bloc.dart';
import 'package:shopping2/ui/screens/settings.screen.dart';
import 'package:shopping2/ui/widgets/account/authenticated-user-card.widget.dart';
import 'package:shopping2/ui/widgets/account/unauthenticated-user-card.widget.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<UserBloc>(context);

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          TextButton(
            child: Icon(
              Icons.settings,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsScreen(),
                ),
              );
            },
          )
        ],
      ),
      body: bloc.user == null
          ? UnauthenticatedUserCard()
          : AuthenticatedUserCard(),
    );
  }
}
