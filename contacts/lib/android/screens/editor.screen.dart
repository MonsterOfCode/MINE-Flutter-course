import 'package:flutter/material.dart';

import 'package:contacts/models/contact.model.dart';

class EditorScreen extends StatelessWidget {
  final Contact contact;

  const EditorScreen({this.contact});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: contact == null ? Text("New Contact") : Text("Editing Contact"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                initialValue: contact?.name,
                onSaved: (value) {
                  contact.name = value;
                },
              ),
              TextFormField(
                initialValue: contact?.email,
                onSaved: (value) {
                  contact.email = value;
                },
              ),
              TextFormField(
                initialValue: contact?.phone,
                onSaved: (value) {
                  contact.phone = value;
                },
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 50,
                child: FlatButton.icon(
                  onPressed: () {},
                  color: theme.primaryColor,
                  label: Text(
                    "Save",
                    style: TextStyle(color: theme.accentColor),
                  ),
                  icon: Icon(
                    Icons.save,
                    color: theme.accentColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
