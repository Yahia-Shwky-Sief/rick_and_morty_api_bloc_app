import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_api_bloc_app/data/models/characters.dart';
import 'package:rick_and_morty_api_bloc_app/data/repo/characters_repo.dart';
part 'characters_state.dart';



class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepo charactersRepo;
  CharactersCubit(this.charactersRepo) : super(CharactersInitial());
  Future<List<Character>> getAllCharacters() async {
      final characters = await charactersRepo.getCharacters();
      emit(CharactersLoaded(characters));
      return characters;
  }
}
