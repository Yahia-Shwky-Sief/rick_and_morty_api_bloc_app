import 'package:flutter/material.dart';
import 'package:rick_and_morty_api_bloc_app/constants/strings.dart';
import 'package:rick_and_morty_api_bloc_app/presentation/screens/home.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(builder: (context) => const Home());
      case characterDetailsScreen:
        return MaterialPageRoute(builder: (context) => const Home());
      default:
        return null;
    }
  }
}
