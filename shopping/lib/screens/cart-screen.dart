import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              child: widgetProductCartList(context),
            ),
          ),
          Container(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      top: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "€ 440",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    margin: EdgeInsets.only(right: 20),
                    child: FlatButton(
                      child: Text(
                        "Checkout",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: null,
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}

Widget widgetProductCartList(BuildContext context) {
  return ListView(
    children: [
      widgetProductCartItem(
          context, "BeoPlay Speaker", "755", "assets/product-1.png"),
      widgetProductCartItem(
          context, "Leather wristwatch", "450", "assets/product-2.png"),
      widgetProductCartItem(
          context, "Smart Bluetooth Speaker", "900", "assets/product-3.png"),
      widgetProductCartItem(
          context, "Smart Luggage", "100", "assets/product-4.png"),
      widgetProductCartItem(
          context, "Smartphone Case", "99", "assets/product-5.png"),
      widgetProductCartItem(
          context, "Speakers Stand", "49", "assets/product-6.png"),
      widgetProductCartItem(context, "Airpods", "199", "assets/product-7.png"),
    ],
  );
}

Widget widgetProductCartItem(
    BuildContext context, String a, String b, String c) {
  return Container(
    height: 120,
    margin: EdgeInsets.all(5),
    child: Row(
      children: [
        Container(
          width: 100,
          height: 100,
          margin: EdgeInsets.all(10),
          child: Image.asset(
            "assets/product-1.png",
            fit: BoxFit.fitWidth,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 20,
            left: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Título do produto"),
              Text(
                "€ 200",
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 30,
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      alignment: Alignment.center,
                      child: FlatButton(
                        child: Text("+"),
                        onPressed: null,
                      ),
                    ),
                    Container(
                        width: 40,
                        alignment: Alignment.center,
                        child: Text("1")),
                    Container(
                      width: 40,
                      alignment: Alignment.center,
                      child: FlatButton(
                        child: Text("-"),
                        onPressed: null,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}
