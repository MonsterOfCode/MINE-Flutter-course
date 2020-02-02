import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:vitual_store/models/user_model.dart';
import 'package:vitual_store/screens/signup_screen.dart';

class LoginScreen extends StatelessWidget {

	final _formkey =  GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
	    appBar: AppBar(
		    title: Text("Login"),
		    centerTitle: true,
		    actions: <Widget>[
		    	IconButton(
				    icon: Icon(Icons.person_add),
				    onPressed: (){
				    	Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>SignupScreen()));
				    },
				    color: Colors.white,
			    ),
		    ],
	    ),
	    body: ScopedModelDescendant<UserModel>(
		    builder: (context, child, model){
		    	if(model.isLoading)
		    		return Center(child: CircularProgressIndicator(),);
		    	return Form(
				    key: _formkey,
				    child: ListView(
					    padding: EdgeInsets.all(16.0),
					    children: <Widget>[
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
								    hintText: "password"
							    ),
							    obscureText: true,
							    validator: (text){
								    if(text.isEmpty || text.length < 6) return "Invalid password";
							    },
						    ),
						    Align(
							    alignment: Alignment.centerRight,
							    child: FlatButton(
								    onPressed: (){},
								    child: Text("Forgot your password?",
									    textAlign: TextAlign.right,
								    ),
								    padding: EdgeInsets.zero,
							    ),
						    ),
						    SizedBox(height: 16.0,),
						    SizedBox(
							    height: 44.0,
							    child: RaisedButton(
								    child: Text("Login",
									    style: TextStyle(fontSize: 18.0),
								    ),
								    textColor: Colors.white,
								    color: Theme.of(context).primaryColor,
								    onPressed: (){
									    /*if(_formkey.currentState.validate()){

									    }*/

									    model.signIn();
								    },
							    ),
						    )
					    ],
				    ),
			    );
		    }
	    )
    );
  }
}
