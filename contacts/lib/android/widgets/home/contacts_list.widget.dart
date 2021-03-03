import 'package:contacts/android/widgets/home/contact_item.widget.dart';
import 'package:contacts/models/contact.model.dart';
import 'package:flutter/material.dart';

class ContactsListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ContactItemWidget(
          contact: Contact(
              id: 0,
              image: "https://www.danymota.com/images/resource/user.jpg",
              name: "Dany Mota",
              phone: "910 9999 000",
              email: "dany*****@gmail.com",
              address: "Strret of castel, 255",
              country: "Portugal"),
        )
      ],
    );
  }
}
