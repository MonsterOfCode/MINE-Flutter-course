import 'package:pokedex/models/pokemon.model.dart';

class PokemonsManager {
  List<Pokemon> pokemons;

  PokemonsManager({this.pokemons});

  PokemonsManager.fromJson(Map<String, dynamic> json) {
    if (json['pokemon'] != null) {
      pokemons = new List<Pokemon>.empty();
      json['pokemon'].forEach((v) {
        pokemons.add(new Pokemon.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pokemons != null) {
      data['pokemon'] = this.pokemons.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
