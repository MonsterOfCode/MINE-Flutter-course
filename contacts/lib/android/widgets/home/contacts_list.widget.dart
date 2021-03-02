import 'package:contacts/android/widgets/home/contact_item.widget.dart';
import 'package:flutter/material.dart';

class ContactsListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ContactItemWidget(
          image: "https://www.danymota.com/images/resource/user.jpg",
          name: "Dany Mota",
          number: "910000000",
          email: "dany*****@gmail.com",
        )
      ],
    );
  }
}
