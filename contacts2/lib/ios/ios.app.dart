import 'package:contacts2/ios/screens/home.screen.dart';
import 'package:contacts2/ios/screens/splash.screen.dart';
import 'package:contacts2/ios/styles.dart';
import 'package:flutter/cupertino.dart';

class IOSApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Contacts',
      debugShowCheckedModeBanner: false,
      theme: iosTheme(),
      home: CupertinoPageScaffold(
        child: HomeScreen(),
      ),
    );
  }
}
