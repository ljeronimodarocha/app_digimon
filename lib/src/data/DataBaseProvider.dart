import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

const digimonTABLE = 'digimon';

const String CREATE_CONTACTS_TABLE_SCRIPT =
    "CREATE TABLE digimon(name TEXT UNIQUE, image TEXT, level TEXT, isFavorite BOOLEAN)";

class DatabaseProvider {
  Future<Database?> getDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'Digimons');
    try {
      return await openDatabase(
        path,
        version: 3,
        onCreate: _onCreate,
      );
    } catch (e) {
      print(e);
    }
  }

  // Código SQL para criar o banco de dados e a tabela
  Future _onCreate(Database db, int version) async {
    await db.execute(CREATE_CONTACTS_TABLE_SCRIPT);
  }
}
