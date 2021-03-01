import 'package:flutter/material.dart';
import 'package:layouts/screens/product.screen.dart';
import 'package:layouts/widgets/categories/category.widget.dart';
import 'package:layouts/widgets/categories/category_list.widget.dart';
import 'package:layouts/widgets/products/product.widget.dart';
import 'package:layouts/widgets/products/product_item.widget.dart';
import 'package:layouts/widgets/products/product_list.widget.dart';
import 'package:layouts/widgets/search.widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SearchWidget(),
                SizedBox(height: 30),
                CategoryWidget(),
                SizedBox(height: 30),
                ProductWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
