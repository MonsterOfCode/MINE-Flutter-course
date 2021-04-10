import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:olx_clone/business_logic/repositories/helpers/tables.keys.dart';

class Category {
  Category(this.id, this.description);

  Category.fromParse(ParseObject object)
      : id = object.objectId,
        description = object.get(KeyCategoryDescription);

  final String id;
  final String description;

  @override
  String toString() => 'Category(id: $id, description: $description)';
}
