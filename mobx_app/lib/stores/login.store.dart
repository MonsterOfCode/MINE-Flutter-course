import 'package:mobx/mobx.dart';
part 'login.store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  @observable
  String email = "";
  @observable
  String password = "";
  @observable
  bool passwordVisible = false;
  @observable
  bool loading = false;
  @observable
  bool loggedIn = false;

  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;

  @action
  void togglePasswordVisibility() => passwordVisible = !passwordVisible;

  @action
  Future<void> login() async {
    loading = true;
    await Future.delayed(Duration(seconds: 2));
    loading = false;
    loggedIn = true;
    email = "";
    password = "";
  }

  @computed
  bool get isEmailValid => email.length > 6;

  @computed
  bool get isPasswordValid => password.length > 6;

  @computed
  void Function() get loginPressed => (isEmailValid && isPasswordValid && !loading) ? login : null;

  @action
  void logout() {
    loggedIn = false;
  }
}
