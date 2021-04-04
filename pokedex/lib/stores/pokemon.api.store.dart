import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:pokedex/repositories/pokemon.repository.dart';
part 'pokemon.api.store.g.dart';

class PokemonApiStore = _PokemonApiStoreBase with _$PokemonApiStore;

abstract class _PokemonApiStoreBase with Store {
  @observable
  PokemonsManager _pokemons;

  @computed
  PokemonsManager get pokemonApi => _pokemons;

  @action
  fetchPokemonList() {
    PokemonRepository.getall.then((pokeList) {
      _pokemons = pokeList;
    });
  }
}
