import 'package:mobx/mobx.dart';
import 'package:olx_clone/business_logic/models/category.model.dart';
part 'create.ad.store.g.dart';

class CreateAdStore = _CreateAdStoreBase with _$CreateAdStore;

abstract class _CreateAdStoreBase with Store {
  ObservableList images = ObservableList();

  @observable
  Category category;

  @action
  void setCategory(Category value) => category = value;
}
