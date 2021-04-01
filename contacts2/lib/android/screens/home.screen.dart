import 'package:contacts2/android/screens/editor.screen.dart';
import 'package:contacts2/android/widgets/home/contacts_list.widget.dart';
import 'package:contacts2/models/contact.model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("My Contacts"),
        centerTitle: true,
        leading: FlatButton(
          onPressed: null,
          child: Icon(
            Icons.search,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      body: ContactsListWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EditorScreen(
                      contact: Contact(id: 0),
                    )),
          );
        },
        child: Icon(
          Icons.add,
          color: Theme.of(context).accentColor,
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
