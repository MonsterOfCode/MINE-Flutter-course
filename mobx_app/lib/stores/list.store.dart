import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_app/stores/todo.store.dart';
part 'list.store.g.dart';

class ListStore = _ListStoreBase with _$ListStore;

abstract class _ListStoreBase with Store {
  @observable
  String newTodoTitle = "";

  ObservableList<TodoStore> todoList = ObservableList<TodoStore>();

  @action
  void setNewTodoTitle(String value) => newTodoTitle = value;

  @action
  void addTodo() {
    todoList.insert(0, TodoStore(newTodoTitle));
    newTodoTitle = "";
  }

  @computed
  bool get isFormValid => newTodoTitle.isNotEmpty;
}
