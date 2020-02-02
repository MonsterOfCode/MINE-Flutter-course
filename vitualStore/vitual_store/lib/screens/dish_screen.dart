import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:vitual_store/datas/dishes_data.dart';

class DishScreen extends StatefulWidget {


	final DishData dish;
	DishScreen(this.dish);

  @override
  _DishScreenState createState() => _DishScreenState(dish);
}

class _DishScreenState extends State<DishScreen> {

	// to pass the top dish to state of view
	final DishData dish;
	String variation;
	_DishScreenState(this.dish);

  @override
  Widget build(BuildContext context) {

  	final Color primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
	    appBar: AppBar(
		    title: Text(dish.title),
		    centerTitle: true,
	    ),
	    body: ListView(
		    children: <Widget>[
		    	AspectRatio(
				    aspectRatio: 0.9,
				    child: Carousel(
					    images: dish.images.map(
						    (img){
						    	return Image.network(img);
						    }
					    ).toList(),
					    dotSize: 4.0,
					    dotSpacing: 15.0,
					    dotBgColor: Colors.transparent,
					    dotColor: primaryColor,
					    autoplay: true,
				    ),
			    ),
			    Container(
				    padding: EdgeInsets.all(16.0),
				    child: Column(
					    crossAxisAlignment: CrossAxisAlignment.stretch,
					    children: <Widget>[
					    	Text(
							    dish.title,
							    style: TextStyle(
								    fontSize: 20.0,
								    fontWeight: FontWeight.w500
							    ),
							    maxLines: 3,
						    ),
						    Text(
							    "${dish.price.toStringAsFixed(2)}€",
							    style: TextStyle(
								    fontSize: 22.0,
								    fontWeight: FontWeight.bold,
								    color: primaryColor
							    ),
						    ),
						    SizedBox(height: 16.0,),
						    Text(
							    "Variations",
							    style: TextStyle(
								    fontSize: 16.0,
								    fontWeight: FontWeight.w500,
							    ),
						    ),
						    SizedBox(
							    height: 34.0,
							    child: GridView(
								    padding: EdgeInsets.symmetric(vertical: 4.0),
								    scrollDirection: Axis.horizontal,
								    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
									    crossAxisCount: 1,
									    mainAxisSpacing: 8.0,
									    childAspectRatio: 0.2
								    ),
								    children: dish.variations.map((v){
								    	return GestureDetector(
										    onTap: (){
										    	setState(() {
										    	  variation = v;
										    	});
										    },
										  child: Container(
											  decoration: BoxDecoration(
												  borderRadius: BorderRadius.all(Radius.circular(4.0)),
												  border: Border.all(
													  color: variation == v ? primaryColor : Colors.grey[500],
													  width: 2.0
												  )
											  ),
											  alignment: Alignment.center,
											  child: Text(v),
										  ),
									    );
								    }).toList(),
							    ),
						    ),
						    SizedBox(height: 16.0,),
						    SizedBox(
							    height: 44.0,
							    child: RaisedButton(
								    onPressed: variation != null ? (){

								    } :null,
								    color: primaryColor,
								    textColor: Colors.white,
								    child: Text("Add to list", style: TextStyle(fontSize: 18.0),)
							    ),
						    ),
						    SizedBox(height: 16.0,),
						    Text(
							    "Description",
							    style: TextStyle(
								    fontSize: 16.0,
								    fontWeight: FontWeight.w500,
							    ),
						    ),
						    Text(
							    dish.description,
							    style: TextStyle(fontSize: 16.0),
						    )
					    ],
				    ),
			    )
		    ],
	    ),
    );
  }
}
