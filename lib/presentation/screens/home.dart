import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_api_bloc_app/data/models/characters.dart';
import 'package:rick_and_morty_api_bloc_app/logic/cubit/characters_cubit.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<Character> characters;
  late List<Character> searchResults;
  bool isSearching = false;
  final TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  Widget _buildSearchField() {
    return TextField(
      controller: searchController,
      decoration: const InputDecoration(hintText: 'Find a character...'),
      onChanged: (searchedCharacter) {
        addSearchedFOrItemsToSearchedList(searchedCharacter);
      },
    );
  }

  void addSearchedFOrItemsToSearchedList(String searchedCharacter) {
    searchResults = characters
        .where((character) =>
            character.name.toLowerCase().contains(searchedCharacter))
        .toList();
    setState(() {});
  }

  List<Widget> _buildAppBarActions() {
    if (isSearching) {
      return [
        IconButton(
          onPressed: () {
            _clearSearch();
            Navigator.pop(context);
          },
          icon: const Icon(Icons.clear),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: _startSearch,
          icon: const Icon(Icons.search),
        ),
      ];
    }
  }

  void _startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));

    setState(() {
      isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearch();

    setState(() {
      isSearching = false;
    });
  }

  void _clearSearch() {
    setState(() {
      searchController.clear();
    });
  }

  buildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          characters = state.characters;
          List<Character> data = [];
          searchController.text.isEmpty
              ? data = state.characters
              : data = searchResults;
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(data[index].name),
                subtitle: Text(data[index].status),
                leading: Image.network(data[index].image),
              );
            },
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: isSearching ? const BackButton() : Container(),
        title: isSearching ? _buildSearchField() : const Text('Characters'),
        actions: _buildAppBarActions(),
      ),
      body: buildBlocWidget(),
    );
  }
}
