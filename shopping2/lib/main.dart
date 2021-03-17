import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping2/blocs/home.bloc.dart';

import 'blocs/cart.bloc.dart';
import 'blocs/theme.bloc.dart';
import 'blocs/user.bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeBloc>.value(
          value: HomeBloc(),
        ),
        // ChangeNotifierProvider<CartBloc>.value(
        //   value: CartBloc(),
        // ),
        // ChangeNotifierProvider<UserBloc>.value(
        //   value: UserBloc(),
        // ),
        // ChangeNotifierProvider<ThemeBloc>.value(
        //   value: ThemeBloc(),
        // ),
      ],
      child: Main(),
    );
  }
}

class Main extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("Shopping"),
        ),
      ),
    );
  }
}
