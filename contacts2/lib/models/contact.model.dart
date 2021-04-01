import 'package:flutter/material.dart';

class Contact {
  int _id;
  String _image;
  String _name;
  String _email;
  String _phone;
  String _address;
  String _country;
  String _latLng;

  Contact(
      {@required int id,
      String image,
      String name,
      String email,
      String phone,
      String address,
      String country,
      String latLng}) {
    this._id = id;
    this._image = image;
    this._name = name;
    this._email = email;
    this._phone = phone;
    this._address = address;
    this._country = country;
    this._latLng = latLng;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get image => _image;
  set image(String image) => _image = image;
  String get name => _name;
  set name(String name) => _name = name;
  String get email => _email;
  set email(String email) => _email = email;
  String get phone => _phone;
  set phone(String phone) => _phone = phone;
  String get address => _address;
  set address(String address) => _address = address;
  String get country => _country;
  set country(String country) => _country = country;
  String get latLng => _latLng;
  set latLng(String latLng) => _country = latLng;

  Contact.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _image = json['image'];
    _name = json['name'];
    _email = json['email'];
    _phone = json['phone'];
    _address = json['address'];
    _country = json['country'];
    _latLng = json['latLng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['image'] = this._image;
    data['name'] = this._name;
    data['email'] = this._email;
    data['phone'] = this._phone;
    data['address'] = this._address;
    data['country'] = this._country;
    data['latLng'] = this._latLng;
    return data;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': _id,
      'image': _image,
      'name': _name,
      'email': _email,
      'phone': _phone,
      'address': _address,
      'country': _country,
      'latLng': latLng,
    };
  }
}
