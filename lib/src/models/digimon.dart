class Digimon {
  final String name;
  String image;
  String level;
  bool isFavorite;

  Digimon(
      {required this.name,
      required this.image,
      required this.level,
      this.isFavorite = false});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'level': level,
      'isFavorite': isFavorite,
    };
  }

  static Digimon fromMap(Map<String, dynamic> map) {
    Digimon digimon = Digimon(
      name: map['name'],
      image: map['image'],
      level: map['level'],
    );
    if (map['isFavorite'] != null) {
      digimon.isFavorite = map['isFavorite'] == 0 ? false : true;
    }
    return digimon;
  }
}
