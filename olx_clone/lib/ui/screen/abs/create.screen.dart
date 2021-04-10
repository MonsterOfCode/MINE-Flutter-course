import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:olx_clone/business_logic/stores/ad/create.ad.store.dart';
import 'package:olx_clone/ui/widgets/ad/images.field.widget.dart';
import 'package:olx_clone/ui/widgets/category/category.field.widget.dart';
import 'package:olx_clone/ui/widgets/drawer/drawer.widget.dart';

class CreateAbScreen extends StatelessWidget {
  final CreateAdStore store = CreateAdStore();

  @override
  Widget build(BuildContext context) {
    const contentPadding = EdgeInsets.fromLTRB(16, 10, 12, 10);
    const labelStyle = TextStyle(fontWeight: FontWeight.w800, color: Colors.grey, fontSize: 18);
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: Text("Create Ab"),
        centerTitle: true,
      ),
      body: Card(
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 8,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ImagesFieldWidget(store: store),
            TextField(
              decoration: InputDecoration(
                labelText: "Title *",
                labelStyle: labelStyle,
                contentPadding: contentPadding,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Description *",
                labelStyle: labelStyle,
                contentPadding: contentPadding,
              ),
              maxLines: null,
            ),
            CategoryFieldWidget(store: store),
            TextField(
              decoration: InputDecoration(
                labelText: "Nif *",
                labelStyle: labelStyle,
                contentPadding: contentPadding,
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Phone *",
                labelStyle: labelStyle,
                contentPadding: contentPadding,
                prefixText: "€ ",
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
