import 'package:contacts/android/widgets/details/avatar.widget.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final String image;
  final String name;
  final String number;
  final String email;

  const DetailsScreen({
    @required this.image,
    @required this.name,
    @required this.number,
    @required this.email,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Contact"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(width: double.infinity, height: 10),
          AvatarWidget(
            image: image,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            name,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            number,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            email,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FlatButton(
                padding: EdgeInsets.all(10),
                onPressed: () {},
                color: theme.primaryColor,
                shape: CircleBorder(side: BorderSide.none),
                child: Icon(
                  Icons.phone,
                  color: theme.accentColor,
                ),
              ),
              FlatButton(
                padding: EdgeInsets.all(10),
                onPressed: () {},
                color: theme.primaryColor,
                shape: CircleBorder(side: BorderSide.none),
                child: Icon(
                  Icons.email,
                  color: theme.accentColor,
                ),
              ),
              FlatButton(
                padding: EdgeInsets.all(10),
                onPressed: () {},
                color: theme.primaryColor,
                shape: CircleBorder(side: BorderSide.none),
                child: Icon(
                  Icons.camera_enhance,
                  color: theme.accentColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 40),
          ListTile(
            title: Text(
              "Address",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Strret of castel, 255",
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  "Portugal",
                  style: TextStyle(fontSize: 12),
                )
              ],
            ),
            isThreeLine: true,
            trailing: FlatButton(
              onPressed: () {},
              child: Icon(
                Icons.pin_drop,
                color: theme.primaryColor,
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: theme.primaryColor,
        child: Icon(Icons.edit, color: theme.accentColor),
      ),
    );
  }
}
