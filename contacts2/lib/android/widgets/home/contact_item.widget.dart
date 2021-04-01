import 'package:contacts2/android/screens/details.screen.dart';
import 'package:contacts2/models/contact.model.dart';
import 'package:flutter/material.dart';

class ContactItemWidget extends StatelessWidget {
  final Contact contact;

  const ContactItemWidget({
    @required this.contact,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 52,
        height: 52,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(52),
          image: DecorationImage(
            image: NetworkImage(contact.image),
          ),
        ),
      ),
      title: Text(contact.name),
      subtitle: Text(contact.phone),
      trailing: FlatButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsScreen(
                      contact: contact,
                    )),
          );
        },
        child: Icon(
          Icons.chat,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
