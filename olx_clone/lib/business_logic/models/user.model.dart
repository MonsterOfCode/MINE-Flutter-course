import 'package:flutter/foundation.dart';

import 'package:olx_clone/business_logic/enums/user_role.enum.dart';

class User {
  String id;
  String name;
  String email;
  String phone;
  String password;
  UserRole role;
  DateTime createdAt;

  User({
    this.id,
    @required this.name,
    @required this.email,
    @required this.phone,
    this.password,
    this.role = UserRole.PARTICULAR,
    this.createdAt,
  });

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, phone: $phone, password: $password, createdAt: $createdAt)';
  }
}
