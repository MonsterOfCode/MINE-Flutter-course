import 'package:flutter/material.dart';
import 'package:layouts/screens/product.screen.dart';

class ProductItem extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final double price;

  ProductItem({
    @required this.image,
    @required this.title,
    @required this.description,
    @required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(5),
      width: 170,
      color: Colors.black12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductScreen(
                    title: title,
                    description: description,
                    image: image,
                    price: price,
                  ),
                ),
              );
            },
            child: Image.asset(
              image,
              width: 170,
              height: 170,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 60,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(
            description,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(height: 5),
          Text(
            "€ $price",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF00C569)),
          ),
        ],
      ),
    );
  }
}
