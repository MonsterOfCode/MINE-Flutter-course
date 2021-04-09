import 'package:olx_clone/business_logic/helpers/extensions.dart';
import 'package:mobx/mobx.dart';
import 'package:olx_clone/business_logic/repositories/user.repository.dart';
part 'login.store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  @observable
  String email;

  @action
  void setEmail(String value) => email = value;

  @computed
  bool get emailValid => email != null && email.isEmailValid();
  String get emailError {
    if (email == null || emailValid) return null;
    if (email.isEmpty)
      return "This field is required!";
    else
      return "Invalid email!";
  }

  @observable
  String password;

  @action
  void setPassword(String value) => password = value;

  @computed
  bool get passwordValid => password != null && password.length >= 8;
  String get passwordError {
    if (password == null || passwordValid)
      return null;
    else
      return "Invalid password!";
  }

  @computed
  bool get isFormValid => emailValid && passwordValid;

  @computed
  Function get loginPressed => isFormValid && !loading ? _login : null;

  @observable
  bool loading = false;

  @observable
  String error;

  @action
  Future<void> _login() async {
    loading = true;

    try {
      final resultUser = await UserRepository().loginWithEmail(email, password);
      print(resultUser);
    } catch (e) {
      error = e;
    }

    loading = false;
  }
}
