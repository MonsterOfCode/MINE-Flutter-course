import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:olx_clone/business_logic/models/category.model.dart';
import 'package:olx_clone/business_logic/stores/category.store.dart';
import 'package:olx_clone/ui/widgets/error_box.repository.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({Key key, this.selected, this.showAll = true}) : super(key: key);

  final Category selected;
  final bool showAll;

  final CategoryStore store = GetIt.I<CategoryStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
      ),
      body: Center(
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 8,
          margin: const EdgeInsets.fromLTRB(32, 12, 32, 32),
          child: Observer(builder: (_) {
            if (store.error != null) {
              return ErrorBoxWidget(message: store.error);
            } else if (store.categoryList.isEmpty) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            final categories = showAll ? store.allCategoryList : store.categoryList;
            return ListView.separated(
              itemCount: categories.length,
              separatorBuilder: (_, __) {
                return Divider(height: 0.1, color: Colors.grey);
              },
              itemBuilder: (_, index) {
                final category = categories[index];
                return InkWell(
                  onTap: () {
                    Navigator.of(context).pop(category);
                  },
                  child: Container(
                    height: 50,
                    color: category.id == selected?.id ? Colors.purple.withAlpha(50) : null,
                    alignment: Alignment.center,
                    child: Text(
                      category.description,
                      style: TextStyle(color: Colors.grey[700], fontWeight: category.id == selected?.id ? FontWeight.bold : null),
                    ),
                  ),
                );
              },
            );
          }),
        ),
      ),
    );
  }
}
