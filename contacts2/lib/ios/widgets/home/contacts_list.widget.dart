import 'package:contacts2/ios/widgets/home/contact_item.widget.dart';
import 'package:contacts2/models/contact.model.dart';
import 'package:flutter/cupertino.dart';

class ContactsListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ContactItemWidget(
              contact: Contact(
                  id: 0,
                  image: "https://www.danymota.com/images/resource/user.jpg",
                  name: "Dany Mota",
                  phone: "910 9999 000",
                  email: "dany*****@gmail.com",
                  address: "Street of castel, 255",
                  country: "Portugal"),
            )
          ],
        ),
      ),
    );
  }
}
