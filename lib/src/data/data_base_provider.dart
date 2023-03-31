import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DatabaseProvider {
  final String CREATE_CONTACTS_TABLE_SCRIPT =
      "CREATE TABLE digimon(name TEXT UNIQUE, image TEXT, level TEXT, isFavorite BOOLEAN)";

  DatabaseProvider._();

  static DatabaseProvider? _instance;

  static DatabaseProvider get instance {
    _instance ??= DatabaseProvider._();
    return _instance!;
  }

  Database? _db;

  Future<Database?> get db => _openDatabase();

  Future<Database?> _openDatabase() async {
    if (Platform.isWindows || Platform.isLinux) {
      sqfliteFfiInit();

      String databasePath = await databaseFactoryFfi.getDatabasesPath();
      String path = join(databasePath, 'DigimonsPC');
      DatabaseFactory databaseFactory = databaseFactoryFfi;
      try {
        _db ??= await databaseFactory.openDatabase(
          path,
          options: OpenDatabaseOptions(
            onCreate: _onCreate,
            version: 3,
          ),
        );
      } on DatabaseException catch (e) {
        throw Exception(e);
      }
    } else {
      Directory documentsDirectory = await getApplicationDocumentsDirectory();
      String path = join(documentsDirectory.path, 'DigimonsAndroid');
      try {
        _db ??= await openDatabase(
          path,
          version: 3,
          onCreate: _onCreate,
        );
      } on DatabaseException catch (e) {
        throw Exception(e);
      }
    }

    return _db!;
  }

  // Código SQL para criar o banco de dados e a tabela
  Future _onCreate(Database db, int version) async {
    db.transaction((reference) async {
      reference.execute(CREATE_CONTACTS_TABLE_SCRIPT);
    });
  }
}
