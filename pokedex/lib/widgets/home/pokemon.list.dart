import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex/stores/pokemon.api.store.dart';

class PokemonList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PokemonApiStore pokemonApiStore = PokemonApiStore();
    pokemonApiStore.fetchPokemonList();
    return Expanded(child: Observer(builder: (_) {
      return pokemonApiStore.pokemonApi != null
          ? ListView.builder(itemBuilder: (context, index) {
              return ListTile();
            })
          : Center(
              child: CircularProgressIndicator(),
            );
    }));
  }
}
