import 'package:contacts/android/screens/address.screen.dart';
import 'package:contacts/android/screens/editor.screen.dart';
import 'package:contacts/models/contact.model.dart';
import 'package:contacts/widgets/avatar.widget.dart';
import 'package:contacts/widgets/text_avatar.widget.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final Contact contact;

  const DetailsScreen({
    @required this.contact,
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
            image: contact.image,
          ),
          SizedBox(
            height: 10,
          ),
          TextAvatarWidget(
              name: contact.name, phone: contact.phone, email: contact.email),
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
                  contact.address,
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  contact.country,
                  style: TextStyle(fontSize: 12),
                )
              ],
            ),
            isThreeLine: true,
            trailing: FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddressScreen(
                            contact: contact,
                          )),
                );
              },
              child: Icon(
                Icons.pin_drop,
                color: theme.primaryColor,
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditorScreen(
                contact: Contact(
                    id: 0,
                    image: "https://www.danymota.com/images/resource/user.jpg",
                    name: "Dany Mota",
                    phone: "910 9999 000",
                    email: "dany*****@gmail.com",
                    address: "Strret of castel, 255",
                    country: "Portugal"),
              ),
            ),
          );
        },
        backgroundColor: theme.primaryColor,
        child: Icon(Icons.edit, color: theme.accentColor),
      ),
    );
  }
}
