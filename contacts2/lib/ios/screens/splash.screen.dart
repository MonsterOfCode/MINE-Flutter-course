import 'package:contacts2/ios/styles.dart';
import 'package:flutter/cupertino.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: primaryColor,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: double.infinity),
            Icon(
              CupertinoIcons.padlock,
              size: 72,
              color: accentColor,
            ),
            SizedBox(height: 20),
            Text(
              "My Contacts",
              style: TextStyle(fontSize: 24, color: accentColor),
            )
          ],
        ),
      ),
    );
  }
}
