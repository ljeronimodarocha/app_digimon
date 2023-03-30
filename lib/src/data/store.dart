import 'dart:async';

import 'package:app_digimon/src/models/digimon.dart';
import 'package:sqflite/sqflite.dart';

import 'DataBaseProvider.dart';

class Store {
  var dbProvider = DatabaseProvider();

  Future<int> salvarDigimon(Digimon digimon) async {
    final db = await dbProvider.getDatabase();
    var result = db!.insert(
      'digimon',
      digimon.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return result;
  }

  Future<Digimon?> findDigimonByName(String name) async {
    final db = await dbProvider.getDatabase();
    var result =
        await db!.query('digimon', where: 'name = ?', whereArgs: [name]);
    if (result.length != 1) {
      return null;
    }
    return Digimon.fromMap(result[0]);
  }
}
