import 'package:flutter/widgets.dart';
import 'package:shopping2/models/category.model.dart';
import 'package:shopping2/ui/widgets/progress_indicator/loader.widget.dart';

import 'category_card.widget.dart';

class CategoryList extends StatelessWidget {
  final List<CategoryModel> categories;

  CategoryList({@required this.categories});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      child: Loader(
        object: categories,
        callback: list,
      ),
    );
  }

  Widget list() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        CategoryModel item = categories[index];

        return Padding(
          padding: EdgeInsets.all(5),
          child: CategoryCard(
            item: item,
          ),
        );
      },
    );
  }
}
