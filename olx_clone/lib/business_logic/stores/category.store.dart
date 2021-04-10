import 'package:mobx/mobx.dart';
import 'package:olx_clone/business_logic/models/category.model.dart';
import 'package:olx_clone/business_logic/repositories/category.repository.dart';
part 'category.store.g.dart';

class CategoryStore = _CategoryStoreBase with _$CategoryStore;

abstract class _CategoryStoreBase with Store {
  _CategoryStoreBase() {
    _loadCategories();
  }

  ObservableList<Category> categoryList = ObservableList<Category>();

  @action
  void setCategories(List<Category> categories) {
    categoryList.clear();
    categoryList.addAll(categories);
  }

  @observable
  String error;

  @action
  void setError(String e) => error = e;

  Future<void> _loadCategories() async {
    try {
      setCategories(await CategoryRepository().getList());
    } catch (e) {
      setError(e);
    }
  }

  @computed
  List<Category> get allCategoryList => List.from(categoryList)..insert(0, Category("*", "All"));
}
