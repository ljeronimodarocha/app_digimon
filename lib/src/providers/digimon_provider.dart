import 'dart:convert';

import 'package:app_digimon/src/models/digimon.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DigimonProvider extends ChangeNotifier {
  final String _url = "https://digimon-api.vercel.app/api/digimon";

  List<Digimon> _digimons = [];
  List<Digimon> _originListDigimons = [];

  List<Digimon> get digimons => [..._digimons];

  Future<void> loadDigimons() async {
    List<Digimon> loadeditems = [];
    final response = await http.get(Uri.parse(_url)).timeout(
          const Duration(seconds: 15),
        );

    List values = jsonDecode(response.body);
    values.forEach((element) {
      loadeditems.add(
        Digimon(
            name: element['name'],
            image: element['img'],
            level: element['level']),
      );
    });

    if (_originListDigimons.isEmpty) {
      _originListDigimons = loadeditems.reversed.toList();
      _digimons = _originListDigimons;
    }
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
