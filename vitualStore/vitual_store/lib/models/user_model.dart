import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:scoped_model/scoped_model.dart';



class UserModel extends Model {

	FirebaseAuth auth = FirebaseAuth.instance;

	FirebaseUser user;
	Map<String, dynamic> userData = Map();
	bool isLoading = false;

	void signUp({@required Map<String, dynamic> userData, @required String pass, @required VoidCallback onSuccess, @required VoidCallback onErro}){
		toggleLoading();

		auth.createUserWithEmailAndPassword(email: userData["email"], password: pass)
		.then((newUser) async{
			user = newUser;
			await saveUserData(userData);
			onSuccess();
			toggleLoading();
		})
		.catchError((e){
			onErro();
			toggleLoading();
		});

	}

	void signIn(){

		isLoading = true;
		notifyListeners();

		Future.delayed(Duration(seconds: 3));
		Timer(Duration(seconds: 3), () {
			isLoading = false;
			notifyListeners();
		});

	}

	void recoverPass(){

	}

	void toggleLoading(){
		isLoading = !isLoading;
		notifyListeners();
	}

	Future<Null> saveUserData(Map<String, dynamic> userData) async{
		this.userData = userData;
		await Firestore.instance.collection("users").document(user.uid).setData(userData);
	}

}