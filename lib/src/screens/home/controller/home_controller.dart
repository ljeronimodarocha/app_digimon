import 'package:app_digimon/src/data/store.dart';

import '../../../models/digimon.dart';

class HomeController {
  Store store = Store();

  Future<bool> digimonIsFavoriteByName(String name) async {
    Digimon? digimon = await store.findDigimonByName(name);
    if (digimon != null && digimon.isFavorite) {
      return true;
    }
    return false;
  }

  Future<void> favoritedDigimon(Digimon digimon) async {
    digimon.isFavorite = !digimon.isFavorite;
    await store.salvarDigimon(digimon);
    Future.value();
  }
}
