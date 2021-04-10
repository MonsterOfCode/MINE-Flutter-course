import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:olx_clone/business_logic/stores/ad/create.ad.store.dart';
import 'package:olx_clone/ui/screen/category/category.screen.dart';

class CategoryFieldWidget extends StatelessWidget {
  const CategoryFieldWidget({Key key, this.store}) : super(key: key);

  final CreateAdStore store;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return ListTile(
        title: Text(
          "Category *",
          style: TextStyle(fontWeight: FontWeight.w800, color: Colors.grey, fontSize: store.category == null ? 18 : 12),
        ),
        trailing: Icon(Icons.keyboard_arrow_down),
        subtitle: store.category == null
            ? null
            : Text(
                "${store.category.description}",
                style: TextStyle(color: Colors.black, fontSize: 17),
              ),
        onTap: () async {
          final category = await showDialog(
            context: context,
            builder: (_) => CategoryScreen(
              showAll: false,
              selected: store.category,
            ),
          );
          if (category != null) {
            store.setCategory(category);
          }
        },
      );
    });
  }
}
