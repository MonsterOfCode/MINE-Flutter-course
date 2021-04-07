import 'package:mobx/mobx.dart';
part 'todo.store.g.dart';

class TodoStore = _TodoStoreBase with _$TodoStore;

abstract class _TodoStoreBase with Store {
  final String title;
  @observable
  bool done = false;

  _TodoStoreBase(this.title);

  @action
  void toggleDone() => done = !done;
}
