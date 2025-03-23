import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_api_bloc_app/constants/strings.dart';
import 'package:rick_and_morty_api_bloc_app/data/repo/characters_repo.dart';
import 'package:rick_and_morty_api_bloc_app/data/services/characters_web_services.dart';
import 'package:rick_and_morty_api_bloc_app/logic/cubit/characters_cubit.dart';
import 'package:rick_and_morty_api_bloc_app/presentation/screens/home.dart';

class AppRouter {
  late CharactersRepo characterRepo;
  late CharactersCubit charactersCubit;
  AppRouter() {
    characterRepo = CharactersRepo(CharactersWebServices());
    charactersCubit = CharactersCubit(characterRepo);
  }
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => charactersCubit,
            child: const Home(),
          ),
        );
      default:
        return null;
    }
  }
}
