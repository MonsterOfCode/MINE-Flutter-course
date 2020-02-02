import 'package:flutter/material.dart';
import 'package:vitual_store/screens/login_screen.dart';

class SignupScreen extends StatelessWidget {

	final _formkey =  GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
	    appBar: AppBar(
		    title: Text("SignUp"),
		    centerTitle: true,
	    ),
	    body: Form(
		    key: _formkey,
		    child: ListView(
			    padding: EdgeInsets.all(16.0),
			    children: <Widget>[
				    TextFormField(
					    decoration: InputDecoration(
						    hintText: "Name"
					    ),
					    validator: (text){
						    if(text.isEmpty) return "Invalid Name";
					    },
				    ),
				    SizedBox(height: 16.0,),
			    	TextFormField(
					    decoration: InputDecoration(
						    hintText: "Email"
					    ),
					    keyboardType: TextInputType.emailAddress,
					    validator: (text){
					    	if(text.isEmpty || !text.contains("@")) return "Invalid Email";
					    },
				    ),
				    SizedBox(height: 16.0,),
				    TextFormField(
					    decoration: InputDecoration(
						    hintText: "Password"
					    ),
					    obscureText: true,
					    validator: (text){
						    if(text.isEmpty || text.length < 6) return "Invalid Password";
					    },
				    ),
				    SizedBox(height: 16.0,),
				    TextFormField(
					    decoration: InputDecoration(
						    hintText: "Address"
					    ),
					    validator: (text){
						    if(text.isEmpty) return "Invalid Address";
					    },
				    ),
				    SizedBox(height: 16.0,),
				    SizedBox(
					    height: 44.0,
					    child: RaisedButton(
						    child: Text("Create",
							    style: TextStyle(fontSize: 18.0),
						    ),
						    textColor: Colors.white,
						    color: Theme.of(context).primaryColor,
						    onPressed: (){
						    	if(_formkey.currentState.validate()){

							    }
						    },
					    ),
				    ),
				    SizedBox(height: 16.0,),
				    Align(
					    alignment: Alignment.centerRight,
					    child: FlatButton(
						    onPressed: (){
							    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginScreen()));
						    },
						    child: Text("Have you already an account?",
							    textAlign: TextAlign.right,
						    ),
						    padding: EdgeInsets.zero,
					    ),
				    ),
			    ],
		    ),
	    ),
    );
  }
}
