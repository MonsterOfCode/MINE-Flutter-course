import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import 'package:pokedex/consts/api.consts.dart';
import 'package:pokedex/managers/api.manager.dart';
part 'pokemon.api.store.g.dart';

class PokemonApiStore = _PokemonApiStoreBase with _$PokemonApiStore;

abstract class _PokemonApiStoreBase with Store {
  @observable
  PokemonApiManager _pokemonApi;

  @computed
  PokemonApiManager get pokemonApi => _pokemonApi;

  @action
  fetchPokemonList() {
    loadPokeAPI().then((pokeList) {
      _pokemonApi = pokeList;
    });
  }

  Future<PokemonApiManager> loadPokeAPI() async {
    try {
      Uri url = Uri.https(ApiConsts.baseURL, ApiConsts.pokemonapiURL);
      final response = await http.get(url);
      var decodedJson = jsonDecode(response.body);
      return PokemonApiManager.fromJson(decodedJson);
    } catch (error, stacktrace) {
      print("Error loading the pokemon list: " + error.toString());
      print(stacktrace.toString());
      return null;
    }
  }
}
