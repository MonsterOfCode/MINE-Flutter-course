import 'package:cloud_firestore/cloud_firestore.dart';

class DishData {

	String category;
	String id;
	String title;
	String description;
	double price;
	List images;
	List variations;

	DishData.fromDocument(DocumentSnapshot snapshot){
		id = snapshot.documentID;
		title = snapshot.data["title"];
		description = snapshot.data["description"];
		price= snapshot.data["price"] + 0.0;
		images = snapshot.data["images"];
		variations = snapshot.data["variations"];
	}

}