import 'dart:async';

import 'package:app_digimon/src/models/digimon.dart';
import 'package:sqflite/sqflite.dart';

import 'data_base_provider.dart';

class Store {
  final DatabaseProvider _connection = DatabaseProvider.instance;

  Future<int> salvarDigimon(Digimon digimon) async {
    final db = await _connection.db;
    var result = await db!.insert(
      'digimon',
      digimon.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return result;
  }

  Future<Digimon?> findDigimonByName(String name) async {
    final db = await _connection.db;
    var result =
        await db!.query('digimon', where: 'name = ?', whereArgs: [name]);
    if (result.length != 1) {
      return null;
    }
    return Digimon.fromMap(result[0]);
  }

  Future<List<Digimon>> findAllFavoritedDigimon() async {
    List<Digimon> lista = [];
    final db = await _connection.db;
    var result = await db!.query('digimon');
    for (var d in result) {
      lista.add(Digimon.fromMap(d));
    }
    return lista;
  }
}
