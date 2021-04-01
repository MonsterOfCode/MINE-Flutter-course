import 'package:contacts2/android/screens/home.screen.dart';
import 'package:contacts2/repositories/contact.repository.dart';
import 'package:flutter/material.dart';
import 'package:contacts2/models/contact.model.dart';

class EditorScreen extends StatefulWidget {
  final Contact contact;

  const EditorScreen({this.contact});

  @override
  _EditorScreenState createState() => _EditorScreenState();
}

class _EditorScreenState extends State<EditorScreen> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = new GlobalKey<FormState>();
  final _repository = ContactRepository();

  onSubmit() {
    if (!_formKey.currentState.validate()) {
      return;
    }

    _formKey.currentState.save();

    if (widget.contact.id == 0)
      create();
    else
      update();
  }

  create() {
    widget.contact.id = null;
    widget.contact.image = null;

    _repository.create(widget.contact).then((_) {
      onSuccess();
    }).catchError((_) {
      onError();
    });
  }

  update() {
    _repository.update(widget.contact).then((_) {
      onSuccess();
    }).catchError((_) {
      onError();
    });
  }

  onSuccess() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
    );
  }

  onError() {
    final snackBar = SnackBar(
      content: Text('Ops, something wrong!'),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: widget.contact.id == 0
            ? Text("New Contact")
            : Text("Editing Contact"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: "Name"),
                initialValue: widget.contact?.name,
                onChanged: (value) {
                  widget.contact.name = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Invalid Name';
                  }
                  return null;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: "Email"),
                initialValue: widget.contact?.email,
                onChanged: (value) {
                  widget.contact.email = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Invalid Email';
                  }
                  return null;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Phone"),
                initialValue: widget.contact?.phone,
                onChanged: (value) {
                  widget.contact.phone = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Invalid Phone';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 50,
                child: FlatButton.icon(
                  onPressed: onSubmit,
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
