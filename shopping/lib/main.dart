import 'package:flutter/material.dart';
import 'package:layouts/screens/cart-screen.dart';
import 'package:layouts/screens/home.screen.dart';
import 'package:layouts/screens/login.screen.dart';
import 'package:layouts/screens/tabs.screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: TabBarView(
            children: [
              HomeScreen(),
              CartScreen(),
              LoginScreen(),
            ],
          ),
          bottomNavigationBar: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.shopping_cart)),
              Tab(icon: Icon(Icons.perm_identity)),
            ],
            labelColor: Theme.of(context).primaryColor,
            unselectedLabelColor: Colors.black38,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.all(5),
            indicatorColor: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
