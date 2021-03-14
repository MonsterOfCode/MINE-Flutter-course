import 'package:flutter/cupertino.dart';
import 'package:imc/ui/ios/screens/home.screen.dart';

class MyCuppertinoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: "Check You IMC",
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
