import 'package:bloc/bloc.dart';
import 'package:flutter_pokedex/models/pokemon_model.dart';
import 'package:meta/meta.dart';

import '../../service/pokemon_service.dart';

part 'pokemon_details_event.dart';
part 'pokemon_details_state.dart';

class PokemonDetailsBloc extends Bloc<PokemonDetailsEvent, PokemonDetailsState> {
  final PokemonService _service;

  PokemonDetailsBloc(this._service) : super(PokemonDetailsInitial()) {
    on<GetPokemonDetailsEvent>((event, emit) async {
      try {
        emit(PokemonDetailsLoading());
        final pokemon = await _service.getPokemon(event.url);
        emit(PokemonDetailsSuccess(pokemon: pokemon));
      } catch (e) {
        emit(PokemonDetailsFailed(message: e.toString()));
      }
    });
  }
}
