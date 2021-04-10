import 'package:olx_clone/business_logic/models/category.model.dart';
import 'package:olx_clone/business_logic/repositories/helpers/parse.errors.dart';
import 'package:olx_clone/business_logic/repositories/helpers/tables.keys.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class CategoryRepository {
  Future<List<Category>> getList() async {
    final queryBuilder = QueryBuilder(ParseObject(KeyCategoryTable))..orderByAscending(KeyCategoryDescription);
    final response = await queryBuilder.query();

    if (response.success) {
      return response.results.map((e) => Category.fromParse(e)).toList();
    } else {
      throw ParseErrors.getDescription(response.error.code);
    }
  }
}
