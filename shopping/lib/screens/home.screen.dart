import 'package:flutter/material.dart';
import 'package:layouts/screens/product.screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 15),
          width: double.infinity,
          color: Color(0xFFF5F5F5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              widgetSearchWidget(),
              SizedBox(height: 30),
              Text(
                "Categories",
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(height: 10),
              Container(
                height: 90,
                child: widgetCategoryList(),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Best Selling",
                    style: TextStyle(fontSize: 30),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Text("See All"),
                  )
                ],
              ),
              SizedBox(height: 10),
              Container(
                height: 350,
                child: widgetProductList(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget widgetSearchWidget() {
  return Container(
    height: 60,
    padding: EdgeInsets.only(left: 20),
    decoration: BoxDecoration(
      color: Colors.black.withOpacity(0.1),
      borderRadius: BorderRadius.all(
        Radius.circular(128),
      ),
    ),
    child: Row(
      children: <Widget>[
        Icon(Icons.search),
        Flexible(
          child: Container(
            padding: EdgeInsets.only(left: 10),
            child: TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: "Search...",
                labelStyle: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                ),
              ),
              style: TextStyle(
                fontSize: 20,
                color: Colors.blue,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget widgetCategoryList() {
  return Container(
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: [
        widgetCategoryItem(),
        widgetCategoryItem(),
        widgetCategoryItem(),
        widgetCategoryItem(),
        widgetCategoryItem(),
        widgetCategoryItem(),
      ],
    ),
  );
}

Widget widgetCategoryItem() {
  return Container(
    width: 70,
    height: 70,
    margin: EdgeInsets.all(10),
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        new BoxShadow(
          color: Colors.black12,
          offset: new Offset(1, 1),
          blurRadius: 5,
          spreadRadius: 2,
        )
      ],
      borderRadius: BorderRadius.all(
        Radius.circular(64),
      ),
    ),
    child: Image.asset("assets/Icon_Devices.png"),
  );
}

Widget widgetProductList(BuildContext context) {
  return Container(
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: [
        widgetProductItem(context),
        widgetProductItem(context),
        widgetProductItem(context),
        widgetProductItem(context),
        widgetProductItem(context),
        widgetProductItem(context),
      ],
    ),
  );
}

Widget widgetProductItem(BuildContext context) {
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
                builder: (context) => ProductScreen(),
              ),
            );
          },
          child: Image.asset(
            "assets/product-1.png",
            width: 170,
            height: 170,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: 60,
          child: Text(
            "Produto",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        SizedBox(height: 5),
        Text(
          "Marca",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w300,
          ),
        ),
        SizedBox(height: 5),
        Text(
          "€ 200",
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF00C569)),
        ),
      ],
    ),
  );
}
