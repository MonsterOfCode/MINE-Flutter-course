import 'package:mobx/mobx.dart';
part 'screen.store.g.dart';

class ScreenStore = _ScreenStoreBase with _$ScreenStore;

abstract class _ScreenStoreBase with Store {
  @observable
  int page = 0;

  @action
  void setScreen(int value) => page = value;
}
