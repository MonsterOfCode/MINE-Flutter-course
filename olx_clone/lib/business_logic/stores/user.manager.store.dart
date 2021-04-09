import 'package:mobx/mobx.dart';
import 'package:olx_clone/business_logic/models/user.model.dart';
import 'package:olx_clone/business_logic/repositories/user.repository.dart';
part 'user.manager.store.g.dart';

class UserManagerStore = _UserManagerStoreBase with _$UserManagerStore;

abstract class _UserManagerStoreBase with Store {
  _UserManagerStoreBase() {
    _getCurrentUser();
  }

  @observable
  User user;

  @action
  void setUser(User value) => user = value;

  @computed
  bool get isLoggedIn => user != null;

  Future<void> _getCurrentUser() async {
    final user = await UserRepository().currentUser();
    setUser(user);
  }
}
