import 'package:contacts2/models/contact.model.dart';
import 'package:flutter/cupertino.dart';

class EditorScreen extends StatelessWidget {
  final Contact contact;

  const EditorScreen({this.contact});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            largeTitle:
                contact == null ? Text("New Contact") : Text("Editing Contact"),
          ),
          SliverFillRemaining(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Form(
                child: Column(children: [
                  CupertinoTextField(
                    placeholder: contact?.name ?? "Name",
                  ),
                  SizedBox(height: 20),
                  CupertinoTextField(
                    placeholder: contact?.email ?? "Email",
                  ),
                  SizedBox(height: 20),
                  CupertinoTextField(
                    placeholder: contact?.phone ?? "Phone",
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: CupertinoButton.filled(
                      onPressed: () {},
                      child: Text(
                        "Save",
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
