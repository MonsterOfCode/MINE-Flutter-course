import 'package:contacts2/models/contact.model.dart';
import 'package:flutter/material.dart';

class AddressScreen extends StatelessWidget {
  final Contact contact;

  const AddressScreen({@required this.contact});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Contact Address"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            height: 80,
            child: ListTile(
              title: Text(
                "Current Address",
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
            ),
          ),
          Container(
            height: 80,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              decoration: InputDecoration(labelText: "Search..."),
            ),
          ),
          Expanded(
            child: Container(color: Colors.blue.withOpacity(0.2)),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: theme.accentColor,
        child: Icon(Icons.my_location, color: theme.primaryColor),
      ),
    );
  }
}
