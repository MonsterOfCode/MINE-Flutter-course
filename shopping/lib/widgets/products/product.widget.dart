import 'package:flutter/material.dart';
import 'package:layouts/widgets/products/product_list.widget.dart';

class ProductWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Best Selling",
                style: Theme.of(context).textTheme.headline1,
              ),
              FlatButton(
                onPressed: () {},
                child: Text("See All"),
              )
            ],
          ),
          Container(
            child: ProductList(),
            height: 350,
          ),
        ],
      ),
    );
  }
}
