import 'package:contacts/ios/screens/address.screen.dart';
import 'package:contacts/ios/screens/editor.screen.dart';
import 'package:contacts/widgets/avatar.widget.dart';
import 'package:contacts/widgets/text_avatar.widget.dart';
import 'package:contacts/models/contact.model.dart';
import 'package:flutter/cupertino.dart';

class DetailsScreen extends StatelessWidget {
  final Contact contact;

  const DetailsScreen({
    @required this.contact,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            largeTitle: Text("Contact"),
            trailing: CupertinoButton(
              child: Icon(CupertinoIcons.pen),
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => EditorScreen(
                      contact: contact,
                    ),
                  ),
                );
              },
            ),
          ),
          SliverFillRemaining(
            child: Column(
              children: [
                SizedBox(height: 10, width: double.infinity),
                AvatarWidget(image: contact.image),
                TextAvatarWidget(
                  name: contact.name,
                  phone: contact.phone,
                  email: contact.email,
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CupertinoButton(
                      onPressed: () {},
                      child: Icon(CupertinoIcons.phone),
                    ),
                    CupertinoButton(
                      onPressed: () {},
                      child: Icon(CupertinoIcons.mail),
                    ),
                    CupertinoButton(
                      onPressed: () {},
                      child: Icon(CupertinoIcons.photo_camera),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: double.infinity),
                            Text(
                              "Address",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16),
                            ),
                            Text(
                              contact.address,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 12),
                            ),
                            Text(
                              contact.country,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      CupertinoButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => AddressScreen(
                                contact: contact,
                              ),
                            ),
                          );
                        },
                        child: Icon(CupertinoIcons.location),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
