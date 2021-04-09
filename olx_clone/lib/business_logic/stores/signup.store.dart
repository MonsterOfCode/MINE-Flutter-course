import 'package:mobx/mobx.dart';
import 'package:olx_clone/business_logic/helpers/extensions.dart';
import 'package:olx_clone/business_logic/models/user.model.dart';
import 'package:olx_clone/business_logic/repositories/user.repository.dart';
part 'signup.store.g.dart';

class SignupStore = _SignupStoreBase with _$SignupStore;

abstract class _SignupStoreBase with Store {
  @observable
  String name;

  @action
  void setName(String value) => name = value;

  @computed
  bool get nameValid => name != null && name.length > 6;
  String get nameError {
    if (name == null || nameValid) return null;
    if (name.isEmpty)
      return "This field is required!";
    else
      return "The name is too short!";
  }

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
  String phone;

  @action
  void setPhone(String value) => phone = value;

  @computed
  bool get phoneValid => phone != null && phone.length >= 9;
  String get phoneError {
    if (phone == null || phoneValid) return null;
    if (phone.isEmpty)
      return "This field is required!";
    else
      return "Invalid phone!";
  }

  @observable
  String password;

  @action
  void setPassword(String value) => password = value;

  @computed
  bool get passwordValid => password != null && password.length >= 8;
  String get passwordError {
    if (password == null || passwordValid) return null;
    if (password.isEmpty)
      return "This field is required!";
    else
      return "Invalid password!";
  }

  @observable
  String password2;

  @action
  void setPassword2(String value) => password2 = value;

  @computed
  bool get password2Valid => password2 == password;
  String get password2Error {
    if (password2 == null || password2Valid)
      return null;
    else
      return "the passwords must be equals!";
  }

  @computed
  bool get isFormValid => nameValid && emailValid && phoneValid && passwordValid && password2Valid;

  @computed
  Function get signupPressed => isFormValid && !loading ? _signup : null;

  @observable
  bool loading = false;

  @observable
  String error;

  @action
  Future<void> _signup() async {
    loading = true;

    final user = User(
      name: name,
      email: email,
      phone: phone,
      password: password,
    );

    try {
      final resultUser = await UserRepository().signup(user);
      print(resultUser);
    } catch (e) {
      error = e;
    }

    loading = false;
  }
}
