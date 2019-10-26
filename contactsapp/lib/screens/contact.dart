import 'dart:io';

import 'package:contactsapp/helpers/contact.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ContactScreen extends StatefulWidget {

  final Contact contact;

  ContactScreen({this.contact});

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {

  Contact transformContact;

  bool contentWasEdited = false;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  final nameFocus = FocusNode();

  @override
  void initState() {
    super.initState();

    if(widget.contact == null){
      transformContact = Contact();
    }else{
      transformContact = Contact.fromMap(widget.contact.toMap());
      nameController.text = transformContact.name;
      emailController.text = transformContact.email;
      phoneController.text = transformContact.phone;
    }

  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: exitingFromScreen,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(transformContact.name ?? "New Contact"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            if(transformContact.name != null && transformContact.name.isNotEmpty){
              Navigator.pop(context, transformContact);
            }else{
              FocusScope.of(context).requestFocus(nameFocus);
            }
          },
          child: Icon(Icons.save),
          backgroundColor: Colors.red,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              GestureDetector(
                child: Container(
                  width: 140.0,
                  height: 140.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: transformContact.img != null ?
                        FileImage(File(transformContact.img)) :
                        AssetImage("resources/images/defaults/man.png"),
                        fit: BoxFit.cover
                    ),
                  ),
                ),
                onTap: (){
                  ImagePicker.pickImage(source: ImageSource.camera).then((photo){
                    if(photo == null) return;
                    setState(() {
                      transformContact.img = photo.path;
                    });
                  });
                },
              ),
              TextField(
                controller: nameController,
                focusNode: nameFocus,
                decoration: InputDecoration(
                  labelText: "Name",
                ),
                onChanged: (text){
                  contentWasEdited = true;
                  setState(() {
                    transformContact.name = text;
                  });
                },
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                ),
                onChanged: (text){
                  contentWasEdited = true;
                  transformContact.email = text;
                },
                keyboardType: TextInputType.emailAddress,
              ),
              TextField(
                controller: phoneController,
                decoration: InputDecoration(
                  labelText: "Phone",
                ),
                onChanged: (text){
                  contentWasEdited = true;
                  transformContact.phone = text;
                },
                keyboardType: TextInputType.phone,
              ),
            ],
          ),
        ),
      ),
    );
  }


  Future<bool> exitingFromScreen(){
    print("#############");
    print(contentWasEdited);
    if(contentWasEdited){
      showDialog(context: context,
      builder: (context){
        return AlertDialog(
          title: Text("Do you whant discart all changes?"),
          content: Text("Your action will be unreversable."),
          actions: <Widget>[
            FlatButton(
              child: Text("Cancel"),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
            FlatButton(
              child: Text("Exit"),
              onPressed: (){
                Navigator.pop(context);
                Navigator.pop(context);
              },
            )
          ],
        );
      }
      );
      return Future.value(false);
    }else{
      return Future.value(true);
    }
  }

//  String pathToDefaultContactImg(int sex){
//    if(sex == 0) return "resources/images/defaults/girl.png";
//    else return "resources/images/defaults/man.png";
//  }

}
