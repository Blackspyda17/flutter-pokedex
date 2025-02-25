import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_pokedex/bloc/pokemon_list/pokemon_list_bloc.dart';
import 'package:flutter_pokedex/service/pokemon_list_service.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  setUp(() {

  });

  group('Pokemon List Bloc Test', (){

    blocTest(
      'emits [PokemonListLoading] when GetPokemonListEvent is added',
      build: () => PokemonListBloc(PokemonListService()),
      act: (bloc) => bloc.add(GetPokemonListEvent(url: 'https://pokeapi.co/api/v2/pokemon/?offset=0&limit=16')),
      expect: () => [isA<PokemonListLoading>()],
    );

    blocTest(
      'emits [PokemonListFailed] when a wrong url is aded in a GetMorePokemonsEvent',
      build: () => PokemonListBloc(PokemonListService()),
      act: (bloc) => bloc.add(GetMorePokemonsEvent(url: "")),
      wait: const Duration(milliseconds: 200),
      expect: () => [isA<PokemonListFailed>()],
    );

  });

}
