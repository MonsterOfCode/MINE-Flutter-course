import 'package:contacts/ios/screens/editor.screen.dart';
import 'package:contacts/ios/widgets/home/contacts_list.widget.dart';
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            largeTitle: Text("My Contacts"),
            trailing: CupertinoButton(
              child: Icon(CupertinoIcons.add),
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => EditorScreen(),
                  ),
                );
              },
            ),
          ),
          SliverFillRemaining(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CupertinoTextField(
                  placeholder: "Search...",
                ),
              ),
              ContactsListWidget(),
            ],
          )),
        ],
      ),
    );
  }
}
