import 'package:rick_and_morty_api_bloc_app/data/models/characters.dart';
import 'package:rick_and_morty_api_bloc_app/data/services/characters_web_services.dart';

class CharactersRepo {
  final CharactersWebServices _api;

  CharactersRepo(this._api);

  Future<List<Character>> getCharacters() async {
    final characters = await _api.getCharacters();
    return characters.map((character) => Character.fromJson(character)).toList();
  }
}