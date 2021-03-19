import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:shopping2/blocs/cart.bloc.dart';
import 'package:shopping2/models/cart_item.model.dart';
import 'package:shopping2/ui/widgets/cart-item.widget.dart';
import 'package:shopping2/ui/widgets/progress_indicator/loader.widget.dart';

class CartScreen extends StatelessWidget {
  var bloc;
  final price = new NumberFormat("#,##0.00", "pt");
  var items = new List<CartItemModel>.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    bloc = Provider.of<CartBloc>(context);
    items = bloc.cart;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 8, right: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Loader(
                  object: bloc.cart,
                  callback: list,
                ),
              ),
              Container(
                height: 80,
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "${price.format(bloc.total)} €",
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    TextButton(
                      child: Text("Checkout"),
                      style: TextButton.styleFrom(
                        primary: Theme.of(context).primaryColor,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget list() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Dismissible(
          child: CartItem(
            item: items[index],
          ),
          key: Key(items[index].id),
          onDismissed: (direction) {
            bloc.remove(items[index]);
          },
          background: Container(
            color: Colors.red.withOpacity(0.1),
          ),
        );
      },
    );
  }
}
