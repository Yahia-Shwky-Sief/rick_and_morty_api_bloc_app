import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rick and Morty API Bloc App'),
      ),
      body: Column(
        children: const [
          Text('Characters Screen'),
          Text('Character Details Screen'),
        ],
      ),
    );  
  }
}