import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping2/blocs/user.bloc.dart';

class AuthenticatedUserCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<UserBloc>(context);

    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: new NetworkImage(bloc.user.image),
                ),
                color: Theme.of(context).primaryColor,
                border: Border.all(
                  width: 4.0,
                  color: const Color(0xFFFFFFFF),
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(200),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Welcome, ${bloc.user.name}"),
            SizedBox(
              height: 10,
            ),
            TextButton(
              child: Text("Logout"),
              onPressed: bloc.logout,
            ),
          ],
        ),
      ),
    );
  }
}
