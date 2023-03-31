import 'dart:convert';

import 'package:app_digimon/src/models/digimon.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../data/store.dart';

class DigimonProvider extends ChangeNotifier {
  final Store _store = Store();

  final String _url = "https://digimon-api.vercel.app/api/digimon";

  List<Digimon> _digimons = [];
  List<Digimon> _originListDigimons = [];

  List<Digimon> get digimons => [..._digimons];

  bool _isselectedFavoriteList = false;

  bool get isselectedFavoriteList => _isselectedFavoriteList;

  Future<void> changeFavoritedList() async {
    _isselectedFavoriteList = !_isselectedFavoriteList;
    await loadDigimons();

    Future.value();
  }

  Future<void> loadDigimons() async {
    if (!_isselectedFavoriteList) {
      List<Digimon> loadeditems = [];
      final response = await http.get(Uri.parse(_url)).timeout(
            const Duration(seconds: 15),
          );

      List values = jsonDecode(response.body);
      for (var element in values) {
        loadeditems.add(
          Digimon(
              name: element['name'],
              image: element['img'],
              level: element['level']),
        );
      }

      if (_originListDigimons.isEmpty) {
        _originListDigimons = loadeditems.reversed.toList();
        _digimons = _originListDigimons;
      } else {
        _digimons = _originListDigimons;
      }
    } else {
      _digimons = await _store.findAllFavoritedDigimon();
    }
    notifyListeners();
    return Future.value();
  }

  void filterDigimon(String nome) {
    if (nome.isNotEmpty) {
      _digimons = _originListDigimons
          .where((element) => element.name.toLowerCase().startsWith(nome))
          .toList();
    } else {
      _digimons = _originListDigimons;
    }
    notifyListeners();
  }
}
