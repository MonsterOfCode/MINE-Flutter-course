import 'package:contacts2/ios/screens/details.screen.dart';
import 'package:contacts2/ios/styles.dart';
import 'package:contacts2/models/contact.model.dart';
import 'package:flutter/cupertino.dart';

class ContactItemWidget extends StatelessWidget {
  final Contact contact;

  const ContactItemWidget({
    @required this.contact,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(52),
            image: DecorationImage(
              image: NetworkImage(contact.image),
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  contact.name,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  contact.phone,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
        CupertinoButton(
          child: Icon(
            CupertinoIcons.person,
            color: primaryColor,
          ),
          onPressed: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => DetailsScreen(contact: contact),
              ),
            );
          },
        ),
      ],
    );
  }
}
