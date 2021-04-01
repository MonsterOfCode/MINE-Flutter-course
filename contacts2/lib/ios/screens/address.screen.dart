import 'package:contacts2/ios/styles.dart';
import 'package:contacts2/models/contact.model.dart';
import 'package:flutter/cupertino.dart';

class AddressScreen extends StatelessWidget {
  final Contact contact;

  const AddressScreen({@required this.contact});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            largeTitle: Text("Address"),
            trailing: CupertinoButton(
              child: Icon(CupertinoIcons.location),
              onPressed: () {},
            ),
          ),
          SliverFillRemaining(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: double.infinity, height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Current Address",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      contact.address,
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      contact.country,
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(height: 40),
                    CupertinoTextField(
                      placeholder: "Search",
                    )
                  ],
                ),
              ),
              SizedBox(height: 15),
              Expanded(
                  child: Container(
                color: primaryColor.withOpacity(0.2),
              ))
            ],
          )),
        ],
      ),
    );
  }
}
