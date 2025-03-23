import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_api_bloc_app/data/models/characters.dart';
import 'package:rick_and_morty_api_bloc_app/data/repo/characters_repo.dart';
part 'characters_state.dart';


class CharactersCubit extends Cubit<CharactersState> {

  CharactersCubit() : super(CharactersInitial());
  getAllCharacters() async {
      final characters = await CharactersRepo().getCharacters();
      emit(CharactersLoaded(characters));
      return characters;
  }
}
