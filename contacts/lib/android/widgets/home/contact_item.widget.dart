import 'package:contacts/android/screens/details.screen.dart';
import 'package:flutter/material.dart';

class ContactItemWidget extends StatelessWidget {
  final String image;
  final String name;
  final String number;
  final String email;

  const ContactItemWidget({
    @required this.image,
    @required this.name,
    @required this.number,
    @required this.email,
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
            image: NetworkImage(image),
          ),
        ),
      ),
      title: Text(name),
      subtitle: Text(number),
      trailing: FlatButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsScreen(
                      image: image,
                      name: name,
                      number: number,
                      email: email,
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
