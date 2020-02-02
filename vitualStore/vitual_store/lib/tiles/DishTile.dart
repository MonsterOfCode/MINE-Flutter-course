import 'package:flutter/material.dart';
import 'package:vitual_store/datas/dishes_data.dart';
import 'package:vitual_store/screens/dish_screen.dart';
import 'package:vitual_store/screens/dishes_screen.dart';

class DishTile extends StatelessWidget {
  final String type;
  final DishData dish;

  DishTile(this.type, this.dish);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => DishScreen(dish)));
      },
      child: Card(
        child: type == "grid"
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 0.8,
                    child: Image.network(
                      dish.images[0],
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Text(dish.title,
                              style: TextStyle(fontWeight: FontWeight.w500)),
                          Text("${dish.price.toStringAsFixed(2)}€",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  )
                ],
              )
            : Row(
          children: <Widget>[
            Flexible(
              flex: 1,
              child: Image.network(
                dish.images[0],
                fit: BoxFit.cover,
                height: 250.0,
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(dish.title,
                        style: TextStyle(fontWeight: FontWeight.w500)),
                    Text("${dish.price.toStringAsFixed(2)}€",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
