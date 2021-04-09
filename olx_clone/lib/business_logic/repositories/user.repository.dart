import 'package:olx_clone/business_logic/enums/user_role.enum.dart';
import 'package:olx_clone/business_logic/models/user.model.dart';
import 'package:olx_clone/business_logic/repositories/helpers/parse.errors.dart';
import 'package:olx_clone/business_logic/repositories/helpers/tables.keys.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class UserRepository {
  //
  Future<User> signup(User user) async {
    // the first is username, and we put email because the parse it will use it to make the login
    final parseUser = ParseUser(user.email, user.password, user.email);
    parseUser.set<String>(KeyUserName, user.name);
    parseUser.set<String>(KeyUserPhone, user.phone);
    parseUser.set(KeyUserRole, user.role.index);

    final response = await parseUser.signUp();
    if (response.success) {
      return mapParseToUser(response.result);
    } else {
      return Future.error(ParseErrors.getDescription(response.error.code));
    }
  }

  Future<User> loginWithEmail(String email, String password) async {
    final parseUser = ParseUser(email, password, null);

    final response = await parseUser.login();

    if (response.success) {
      return mapParseToUser(response.result);
    } else {
      return Future.error(ParseErrors.getDescription(response.error.code));
    }
  }

  Future<User> currentUser() async {
    final parseUser = await ParseUser.currentUser();
    if (parseUser != null) {
      final response = await ParseUser.getCurrentUserFromServer(parseUser.sessionToken);
      if (response.success)
        return mapParseToUser(response.result);
      else
        await parseUser.logout();
    }
    return null;
  }

  User mapParseToUser(ParseUser parseUser) {
    return User(
      id: parseUser.objectId,
      name: parseUser.get(KeyUserName),
      email: parseUser.get(KeyUserEmail),
      phone: parseUser.get(KeyUserPhone),
      role: UserRole.values[parseUser.get(KeyUserRole)],
      createdAt: parseUser.get(KeyUserCreatedAt),
    );
  }
}
