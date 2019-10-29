import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';

void main(){
  runApp(MyApp());
}

final ThemeData iOSTheme = ThemeData(
    primarySwatch: Colors.orange,
    primaryColor: Colors.grey[100],
    primaryColorBrightness: Brightness.light
);

final ThemeData defaultTheme = ThemeData(
  primarySwatch: Colors.purple,
  accentColor: Colors.orangeAccent[400],
);

final googleSignIn = GoogleSignIn();
final auth = FirebaseAuth.instance;

//await auth.signInWithCredential(GoogleAuthProvider.getCredential(
//idToken: credentials.idToken, accessToken: credentials.accessToken));

Future<Null> ensureLoggedIn() async{
  GoogleSignInAccount user = googleSignIn.currentUser;
  // try authenticate on google
  if(user == null)
    user = await googleSignIn.signInSilently();

  // if is not yet loggin request to user
  if(user == null)
    user = await googleSignIn.signIn();

  // autenticate on firebase
  if(await auth.currentUser() == null){
    GoogleSignInAuthentication credentials = await googleSignIn.currentUser.authentication;
    await auth.signInWithCredential(GoogleAuthProvider.getCredential(idToken: credentials.idToken, accessToken: credentials.accessToken));
  }
}

handleSubmited(String text) async{
  await ensureLoggedIn();
  sendMessage(text: text);
}


void sendMessage({String text, String imgUrl}){
  Firestore.instance.collection("messages").add(
      {
        "text": text,
        "imgUrl": imgUrl,
        "senderName": googleSignIn.currentUser.displayName,
        "senderPhotoUrl": googleSignIn.currentUser.photoUrl,
      }
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ChatApp",
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context).platform == TargetPlatform.iOS ? iOSTheme : defaultTheme,
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      top: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Chat App"),
          centerTitle: true,
          elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: StreamBuilder(
                stream: Firestore.instance.collection("messages").snapshots(),
                builder: (context, snapshot){
                  switch(snapshot.connectionState){
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    default:
                      return ListView.builder(
                          reverse: true,
                          itemCount: snapshot.data.documents.length,
                          itemBuilder: (context, index){
                            List r = snapshot.data.documents.reversed.toList();
                            return ChatMessage(r[index].data);
                          }
                      );
                  }
                },
              ),
            ),
            Divider(
              height: 1.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
              ),
              child: TextComposer(),
            )
          ],
        ),
      ),
    );
  }
}


class TextComposer extends StatefulWidget {
  @override
  _TextComposerState createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> {

  bool isComposing = false;

  final textController = TextEditingController();

  void reset(){
    textController.clear();
    setState(() {
      isComposing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).accentColor),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: Theme.of(context).platform == TargetPlatform.iOS ? BoxDecoration(
            border: Border(top: BorderSide(color: Colors.grey[200]))
        ) : null,
        child: Row(
          children: <Widget>[
            Container(
              child: IconButton(
                icon: Icon(Icons.photo_camera),
                onPressed: () async {
                  await ensureLoggedIn();
                  File imageFile = await ImagePicker.pickImage(source: ImageSource.camera);
                  if(imageFile == null) return;

                  StorageUploadTask task = FirebaseStorage.instance.ref()
                      .child("photos")
                      .child(googleSignIn.currentUser.id.toString() + DateTime.now().millisecondsSinceEpoch.toString())
                      .putFile(imageFile);

                  StorageTaskSnapshot taskSnapshot = await task.onComplete;
                  String url = await taskSnapshot.ref.getDownloadURL();
                  sendMessage(imgUrl: url);
                },
              ),
            ),
            Expanded(
              child: TextField(
                controller: textController,
                decoration: InputDecoration(
                    hintText: "Send a Message"
                ),
                onChanged: (text){
                  setState(() {
                    isComposing = text.length > 0;
                  });
                },
                onSubmitted: (text){
                  handleSubmited(text);
                  reset();
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Theme.of(context).platform == TargetPlatform.iOS ?
              CupertinoButton(
                child: Text("Send"),
                onPressed: isComposing ? (){
                  handleSubmited(textController.text);
                  reset();
                } : null,
              ) :
              IconButton(
                icon: Icon(Icons.send),
                onPressed: isComposing ? (){
                  handleSubmited(textController.text);
                  reset();
                } : null,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {

  final Map<String, dynamic> data;

  ChatMessage(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(data["senderPhotoUrl"]),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(data["senderName"],
                  style: Theme.of(context).textTheme.subhead,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: data["imgUrl"] != null ? Image.network(data["imgUrl"], width: 250.0,) :
                  Text(data["text"]),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

