import 'package:pokedex/models/pokemon.model.dart';

class WebManager {
  WebManager._privateConstructor();

  static final WebManager _instance = WebManager._privateConstructor();

  static WebManager get instance => _instance;

  static String baseURL = 'raw.githubusercontent.com';
  static String pokemonsPath = 'MonsterOfCode/Flutter-Studying/master/apis/pokemon/pokedex.json';
}
