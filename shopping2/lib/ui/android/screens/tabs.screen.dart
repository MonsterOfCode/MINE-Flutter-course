import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping2/blocs/cart.bloc.dart';
import 'package:shopping2/ui/screens/account.screen.dart';
import 'package:shopping2/ui/screens/cart.screen.dart';
import 'package:shopping2/ui/android/screens/home.screens.dart';

class TabsScreenAndroid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<CartBloc>(context);

    return Scaffold(
      body: TabBarView(
        children: [
          HomeScreen(),
          CartScreen(),
          AccountScreen(),
        ],
      ),
      bottomNavigationBar: TabBar(
        tabs: [
          Tab(icon: Icon(Icons.home)),
          Tab(
              icon: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.shopping_cart),
              bloc.cart.length > 0
                  ? Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Center(
                        child: Text(
                          bloc.cart.length.toString(),
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  : SizedBox()
            ],
          )),
          Tab(icon: Icon(Icons.perm_identity)),
        ],
        labelColor: Theme.of(context).primaryColor,
        unselectedLabelColor: Colors.black38,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorPadding: EdgeInsets.all(5.0),
        indicatorColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
