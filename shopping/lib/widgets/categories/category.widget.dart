import 'package:flutter/material.dart';
import 'category_list.widget.dart';

class CategoryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Categories",
          style: Theme.of(context).textTheme.headline1,
        ),
        SizedBox(height: 10),
        Container(
          height: 90,
          child: CategoryList(),
        ),
      ],
    );
  }
}
