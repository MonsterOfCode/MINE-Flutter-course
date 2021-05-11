import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:olx_clone/business_logic/stores/category.store.dart';
import 'package:olx_clone/business_logic/stores/user.manager.store.dart';
import 'package:olx_clone/ui/screen/base/base.screen.dart';
import 'package:olx_clone/business_logic/stores/screen.store.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

void main() async {
  // Make sure that the binding of flutter was already initialized before connect to perseServer
  WidgetsFlutterBinding.ensureInitialized();
  await initializeParseServer();
  setupLocators();
  runApp(MyApp());
}

void setupLocators() {
  GetIt.I.registerSingleton(ScreenStore());
  GetIt.I.registerSingleton(UserManagerStore());
  GetIt.I.registerSingleton(CategoryStore());
}

Future<void> initializeParseServer() async {
  await Parse().initialize(
    "8GYArooGsmJ19lhzdk9dF4La8NfCYzotoplrDWS9",
    "https://parseapi.back4app.com/",
    clientKey: "rOm6zqIh6xk1R7xVZLYnoRWfHoRTH84zGjwBBc1D",
    autoSendSessionId: true,
    debug: true,
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Olx',
      theme: ThemeData(
        primaryColor: Colors.purple,
        scaffoldBackgroundColor: Colors.purple,
        appBarTheme: AppBarTheme(
          elevation: 0,
        ),
      ),
      home: BaseScreen(),
    );
  }
}
