import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_pokedex/bloc/pokemon_details/pokemon_details_bloc.dart';
import 'package:flutter_pokedex/bloc/pokemon_list/pokemon_list_bloc.dart';
import 'package:flutter_pokedex/service/pokemon_list_service.dart';
import 'package:flutter_pokedex/service/pokemon_service.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {

  String pokemon = "https://pokeapi.co/api/v2/pokemon/8";
  setUp(() {

  });

  group('Pokemon Details Bloc Test', (){

    blocTest(
      'emits [PokemonDetailsLoading] when GetPokemonDetailsEvent is added',
      build: () => PokemonDetailsBloc(PokemonService()),
      act: (bloc) => bloc.add(GetPokemonDetailsEvent(url: pokemon)),
      expect: () => [isA<PokemonDetailsLoading>()],
    );


  });

}
