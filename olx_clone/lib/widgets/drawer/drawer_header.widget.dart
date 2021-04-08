import 'package:flutter/material.dart';
import 'package:olx_clone/screen/account/login.screen.dart';

class DrawerHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
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
                    "Access to you account now!",
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Click here",
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
