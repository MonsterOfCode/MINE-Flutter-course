import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:olx_clone/business_logic/stores/screen.store.dart';
import 'package:olx_clone/business_logic/stores/user.manager.store.dart';
import 'package:olx_clone/ui/screen/account/login.screen.dart';

class DrawerHeaderWidget extends StatelessWidget {
  final UserManagerStore store = GetIt.I<UserManagerStore>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        if (store.isLoggedIn)
          GetIt.I<ScreenStore>().setScreen(4);
        else
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => LoginScreen()));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 95,
        color: Colors.purple,
        child: Row(
          children: [
            Icon(
              Icons.person,
              color: Colors.white,
              size: 35,
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    store.isLoggedIn ? store.user.name : "Access to you account now!",
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    store.isLoggedIn ? store.user.email : "Click here",
                    style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
