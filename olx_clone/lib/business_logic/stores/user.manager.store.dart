import 'package:mobx/mobx.dart';
import 'package:olx_clone/business_logic/models/user.model.dart';
part 'user.manager.store.g.dart';

class UserManagerStore = _UserManagerStoreBase with _$UserManagerStore;

abstract class _UserManagerStoreBase with Store {
  @observable
  User user;

  @action
  void setUser(User value) => user = value;
}
