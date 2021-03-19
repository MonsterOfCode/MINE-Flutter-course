import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping2/blocs/cart.bloc.dart';
import 'package:shopping2/models/cart_item.model.dart';
import 'package:shopping2/models/product_list_item.model.dart';

class AddToCart extends StatelessWidget {
  final ProductListItemModel item;

  AddToCart({@required this.item});

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<CartBloc>(context);
    var cartItem = new CartItemModel(
      id: item.id,
      price: item.price,
      image: item.image,
      quantity: 1,
      title: item.title,
    );

    if (!bloc.itemInCart(cartItem)) {
      return Container(
        width: 80,
        height: 40,
        child: TextButton(
          style: TextButton.styleFrom(
            primary: Colors.white,
            backgroundColor: Theme.of(context).primaryColor,
          ),
          child: Icon(Icons.add_shopping_cart),
          onPressed: () {
            bloc.add(
              cartItem,
            );
            final snackBar = SnackBar(content: Text('${item.title} added'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
        ),
      );
    } else {
      return Container(
        width: 80,
        height: 40,
        child: TextButton(
          style: TextButton.styleFrom(
            primary: Colors.red,
            backgroundColor: Theme.of(context).primaryColor,
          ),
          child: Icon(Icons.remove_shopping_cart),
          onPressed: () {
            bloc.remove(
              cartItem,
            );
            final snackBar = SnackBar(content: Text('${item.title} removed'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
        ),
      );
    }
  }
}
