import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _todoList = [];
  Map<String, dynamic> _lastRemoved;
  int _lastRemovedPos;

  final _fieldTodoController = TextEditingController();


  @override
  void initState() {
    super.initState();
    _readData().then((data){
      setState(() {
        _todoList = json.decode(data);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(17.0, 0, 7.0, 1.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: "New Todo",
                        labelStyle: TextStyle(color: Colors.blueAccent)),
                    controller: _fieldTodoController,
                  ),
                ),
                RaisedButton(
                  color: Colors.blueAccent,
                  child: Text("ADD"),
                  textColor: Colors.white,
                  onPressed: _addTodo,
                )
              ],
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: _reorderTodoList,
              child: ListView.builder(
                  padding: EdgeInsets.only(top: 10.0),
                  itemCount: _todoList.length,
                  itemBuilder: _buildItem),
            )
          )
        ],
      ),
    );
  }

  void _addTodo() {
    Map<String, dynamic> newTodo = {};

    newTodo["title"] = _fieldTodoController.text;

    _fieldTodoController.text = "";

    newTodo["ok"] = false;

    setState(() {
      _todoList.insert(0, newTodo);
    });
    _saveData();
  }

  Future<Null> _reorderTodoList() async{
    await Future.delayed(Duration(seconds: 1));
    _todoList.sort((a, b){
      if(a["ok"] && !b["ok"]) return 1;
      else if(!a["ok"] && b["ok"]) return -1;
      else return 0;
    });

    setState(() {
      _saveData();
    });

    return null;
  }

  Widget _buildItem(BuildContext context, int index){
    return Dismissible(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      background: Container(
        color: Colors.red,
        child: Align(
          alignment: Alignment(-0.9, 0.0),
          child: Icon(Icons.delete, color: Colors.white),
        ),
      ),
      direction: DismissDirection.startToEnd,
      child: CheckboxListTile(
        title: Text(_todoList[index]["title"]),
        value: _todoList[index]["ok"],
        secondary: CircleAvatar(
          child: Icon(
              _todoList[index]["ok"] ? Icons.check : Icons.error_outline),
        ),
        onChanged: (bool){
          setState(() {
            _todoList[index]["ok"] = bool;
            _saveData();
          });
        },
      ),
      onDismissed: (direction){
        _lastRemoved = Map.from(_todoList[index]);
        _lastRemovedPos = index;
        _todoList.removeAt(index);

        setState(() {
          _saveData();
        });

        final snack = SnackBar(
          content: Text("Todo \"${_lastRemoved["title"]}\" removed!"),
          action: SnackBarAction(
            label: "Undo",
            onPressed: (){
              setState(() {
                _todoList.insert(_lastRemovedPos, _lastRemoved);
              });
            }),
          duration: Duration(seconds: 3),
        );

        Scaffold.of(context).removeCurrentSnackBar();
        Scaffold.of(context).showSnackBar(snack);
      });
  }

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/data.json");
  }

  Future<File> _saveData() async {
    String data = jsonEncode(_todoList);
    final file = await _getFile();
    return file.writeAsString(data);
  }

  Future<String> _readData() async {
    try {
      final file = await _getFile();
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }
}
