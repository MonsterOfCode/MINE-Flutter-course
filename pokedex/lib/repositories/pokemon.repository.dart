import 'package:dio/dio.dart';
import 'package:pokedex/models/pokemon.model.dart';
import 'package:pokedex/settings/api.settings.dart';

class PokemonRepository {
  Future<List<Pokemon>> getAll() async {
    try {
      Response response = await Dio().get("${ApiSettings.baseURL}/${ApiSettings.pokemonsPath}");
      return (response.data as List).map((course) => Pokemon.fromJson(course)).toList();
    } catch (error, stacktrace) {
      print("Error loading the pokemon list: " + error.toString());
      print(stacktrace.toString());
      return null;
    }
  }
}
