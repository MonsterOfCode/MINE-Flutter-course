import 'package:mobx/mobx.dart';
part 'login.store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  _LoginStoreBase() {
    autorun((_) {
      print(isFormValid);
    });
  }

  @observable
  String email = "";
  @observable
  String password = "";

  @action
  void setEmail(String value) => email = value;
  @action
  void setPassword(String value) => password = value;

  @computed
  bool get isEmailValid => email.length > 6;

  @computed
  bool get isPasswordValid => password.length > 6;

  @computed
  bool get isFormValid => isEmailValid && isPasswordValid;
}
