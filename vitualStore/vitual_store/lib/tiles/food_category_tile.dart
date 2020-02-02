import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vitual_store/screens/dishes_screen.dart';

class FoodCategoryTile extends StatelessWidget {

	final DocumentSnapshot snapshot;

	FoodCategoryTile(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return ListTile(
	    leading: CircleAvatar(
		    radius: 25.0,
		    backgroundColor: Colors.transparent,
		    backgroundImage: NetworkImage(snapshot.data["img"]),
	    ),
	    title: Text(snapshot.data["title"]),
	    trailing: Icon(Icons.keyboard_arrow_right),
	    onTap: (){
	    	Navigator.of(context).push(
			    MaterialPageRoute(builder: (context) => DishesScreen(snapshot))
		    );
	    },
    );
  }
}
