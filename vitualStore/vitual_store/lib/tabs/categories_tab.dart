import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vitual_store/tiles/food_category_tile.dart';

class CategoriesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: Firestore.instance.collection("food_categories").getDocuments(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(
            child: CircularProgressIndicator(),
          );
        else {
          var dividedTiles = ListTile.divideTiles(
                  tiles: snapshot.data.documents.map((doc) {
                    return FoodCategoryTile(doc);
                  }).toList(),
                  color: Colors.grey[500])
              .toList();

          return ListView(children: dividedTiles);
        }
      },
    );
  }
}
