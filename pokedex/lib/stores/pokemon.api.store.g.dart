// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.api.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokemonApiStore on _PokemonApiStoreBase, Store {
  Computed<dynamic>? _$pokemonApiComputed;

  @override
  dynamic get pokemonApi =>
      (_$pokemonApiComputed ??= Computed<dynamic>(() => super.pokemonApi,
              name: '_PokemonApiStoreBase.pokemonApi'))
          .value;

  final _$_pokemonApiAtom = Atom(name: '_PokemonApiStoreBase._pokemonApi');

  @override
  dynamic get _pokemonApi {
    _$_pokemonApiAtom.reportRead();
    return super._pokemonApi;
  }

  @override
  set _pokemonApi(dynamic value) {
    _$_pokemonApiAtom.reportWrite(value, super._pokemonApi, () {
      super._pokemonApi = value;
    });
  }

  final _$_PokemonApiStoreBaseActionController =
      ActionController(name: '_PokemonApiStoreBase');

  @override
  dynamic fetchPokemonList() {
    final _$actionInfo = _$_PokemonApiStoreBaseActionController.startAction(
        name: '_PokemonApiStoreBase.fetchPokemonList');
    try {
      return super.fetchPokemonList();
    } finally {
      _$_PokemonApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pokemonApi: ${pokemonApi}
    ''';
  }
}
