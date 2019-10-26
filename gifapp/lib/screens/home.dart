import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gifapp/screens/gif.dart';
import 'package:http/http.dart' as http;
import 'package:share/share.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String baseURL = "https://api.giphy.com/v1/gifs/";
  String apiKey = "?api_key=Qtbp5Pa7D98rozW88Mle5xlETN4N9C5P";
  int pagination = 9;
  int offset = 0;

  String textToSearch;

  Future<Map> _searchGifsApi() async{
    http.Response response;
    if(userIsSearching())
      response = await http.get("${baseURL}trending$apiKey&limit=${pagination+1}&rating=G");
    else
      response = await http.get("${baseURL}search$apiKey&q=$textToSearch&limit=$pagination&offset=$offset&rating=G&lang=en");

    return json.decode((response.body));
  }

  @override
  void initState() {
    super.initState();
    _searchGifsApi().then((map){
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.network("https://developers.giphy.com/static/img/dev-logo-lg.7404c00322a8.gif"),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                  labelText: "Seach for your gif",
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder()
              ),
              style: TextStyle(color: Colors.white, fontSize: 18.0),
              textAlign: TextAlign.center,
              onSubmitted: (text){
                setState(() {
                  textToSearch = text;
                  offset = 0;
                });
              },
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: _searchGifsApi(),
              builder: (context,  snapshot){
                switch(snapshot.connectionState){
                  case ConnectionState.waiting:
                  case ConnectionState.none:
                    return Container(
                      width: 200.0,
                      height: 200.0,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        strokeWidth: 5.0,
                      ),
                    );
                  default:
                    if(snapshot.hasError) return Container();
                    else return _creatGifGread(context, snapshot);
                }
              },
            ),
          ),
        ],
      ),
    );
  }


  int _getCount(List data){
    if(userIsSearching())
      return data.length;
    else
      return data.length + 1;
  }

  bool userIsSearching(){
    return textToSearch == null ||  textToSearch.isEmpty;
  }

  Widget _creatGifGread(BuildContext context, AsyncSnapshot snapshot){
    return GridView.builder(
        padding: EdgeInsets.all(10.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0
        ),
        itemCount: _getCount(snapshot.data["data"]),
        itemBuilder: (context, index){
          if(userIsSearching() || index < snapshot.data["data"].length)
            return GestureDetector(
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                  image: snapshot.data["data"][index]["images"]["fixed_height"]["url"],
                height: 300.0,
                fit: BoxFit.cover,
              ),
              onTap: (){
                Navigator.push(context,
                MaterialPageRoute(
                  builder: (context)=> GifScreen(snapshot.data["data"][index])
                ));
              },
              onLongPress: (){
                Share.share(snapshot.data["data"][index]["images"]["fixed_height"]["url"]);
              },
            );
          else
            return Container(
              child: GestureDetector(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.add, color: Colors.white, size: 70.0,),
                    Text(
                      "Show more...",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.0
                      ),
                    )
                  ],
                ),
                onTap: (){
                  setState(() {
                    offset += 9;
                  });
                },
              ),
            );
        }
    );
  }

}
