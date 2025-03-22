import 'package:flutter/material.dart';
import 'package:rick_and_morty_api_bloc_app/presentation/screens/home.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const Home());
      default:
        return null;
    }
  }
}
