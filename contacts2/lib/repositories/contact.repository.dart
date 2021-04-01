import 'package:contacts2/models/contact.model.dart';
import 'package:contacts2/settings.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ContactRepository {
  Future<Database> _getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), DATABASE_NAME),
      onCreate: (db, version) {
        return db.execute(CREATE_CONTACTS_TABLE_SCRIPT);
      },
      version: 1,
    );
  }

  Future create(Contact model) async {
    try {
      final Database db = await _getDatabase();

      await db.insert(
        TABLE_NAME,
        model.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (ex) {
      print(ex);
      return;
    }
  }

  Future<List<Contact>> getContacts() async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> maps = await db.query(TABLE_NAME);

      return List.generate(
        maps.length,
        (i) {
          return Contact(
            id: maps[i]['id'],
            name: maps[i]['name'],
            phone: maps[i]['phone'],
            email: maps[i]['email'],
            image: maps[i]['image'],
            address: maps[i]['address'],
            country: maps[i]['country'],
            latLng: maps[i]['latLng'],
          );
        },
      );
    } catch (ex) {
      print(ex);
      return new List<Contact>();
    }
  }

  Future<List<Contact>> search(String term) async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> maps = await db.query(
        TABLE_NAME,
        where: "name LIKE ?",
        whereArgs: [
          '%$term%',
        ],
      );

      return List.generate(
        maps.length,
        (i) {
          return Contact(
            id: maps[i]['id'],
            name: maps[i]['name'],
            phone: maps[i]['phone'],
            email: maps[i]['email'],
            image: maps[i]['image'],
            address: maps[i]['address'],
            country: maps[i]['country'],
            latLng: maps[i]['latLng'],
          );
        },
      );
    } catch (ex) {
      print(ex);
      return new List<Contact>();
    }
  }

  Future<Contact> getContact(int id) async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> maps = await db.query(
        TABLE_NAME,
        where: "id = ?",
        whereArgs: [id],
      );

      return Contact(
        id: maps[0]['id'],
        name: maps[0]['name'],
        phone: maps[0]['phone'],
        email: maps[0]['email'],
        image: maps[0]['image'],
        address: maps[0]['address'],
        country: maps[0]['country'],
        latLng: maps[0]['latLng'],
      );
    } catch (ex) {
      print(ex);
      return null;
    }
  }

  Future update(Contact model) async {
    try {
      final Database db = await _getDatabase();

      await db.update(
        TABLE_NAME,
        model.toMap(),
        where: "id = ?",
        whereArgs: [model.id],
      );
    } catch (ex) {
      print(ex);
      return;
    }
  }

  Future delete(int id) async {
    try {
      final Database db = await _getDatabase();
      await db.delete(
        TABLE_NAME,
        where: "id = ?",
        whereArgs: [id],
      );
    } catch (ex) {
      print(ex);
      return;
    }
  }

  Future updateImage(int id, String imagePath) async {
    try {
      final Database db = await _getDatabase();
      final model = await getContact(id);

      model.image = imagePath;

      await db.update(
        TABLE_NAME,
        model.toMap(),
        where: "id = ?",
        whereArgs: [model.id],
      );
    } catch (ex) {
      print(ex);
      return;
    }
  }

  Future updateAddress(
      int id, String address, String country, String latLong) async {
    try {
      final Database db = await _getDatabase();
      final model = await getContact(id);

      model.address = address;
      model.country = country;
      model.latLng = latLong;

      await db.update(
        TABLE_NAME,
        model.toMap(),
        where: "id = ?",
        whereArgs: [model.id],
      );
    } catch (ex) {
      print(ex);
      return;
    }
  }
}
