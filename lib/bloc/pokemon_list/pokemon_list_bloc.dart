import 'package:bloc/bloc.dart';
import 'package:flutter_pokedex/service/pokemon_list_service.dart';
import 'package:meta/meta.dart';

import '../../models/pokemon_list_model.dart';

part 'pokemon_list_event.dart';
part 'pokemon_list_state.dart';

class PokemonListBloc extends Bloc<PokemonListEvent, PokemonListState> {
  final PokemonListService _service;
  PokemonListBloc(this._service) : super(PokemonListInitial()) {
    PokemonListModel? pokemonList;

    on<GetPokemonListEvent>((event, emit) async {
      try {
        emit(PokemonListLoading());
        pokemonList = await _service.getPokemonList(event.url);
        emit(PokemonListSuccess(pokemonList: pokemonList!));
      } catch (e) {
        emit(PokemonListFailed(message: e.toString()));
      }
    });

    on<GetMorePokemonsEvent>((event, emit) async {
      try {
        final newPokemonList = await _service.getPokemonList(event.url);
        pokemonList?.results.addAll(newPokemonList.results);
        emit(PokemonListSuccess(pokemonList: pokemonList!));
      } catch (e) {
        emit(PokemonListFailed(message: e.toString()));
      }
    });
  }
}
